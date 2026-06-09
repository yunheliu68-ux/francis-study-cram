#!/bin/bash
# 一键推到 GitHub。我已经在本地建好 git 仓库并完成首次提交，
# 这个脚本只做一件事：在 GitHub 上建 public repo + push。
#
# 运行前请确认：
# 1. 已安装 gh CLI（macOS：brew install gh）
# 2. 已登录 gh（gh auth login，浏览器一次授权终身有效）
#
# 用法：在 Terminal 里
#   cd "/Users/francis/Desktop/ECO212复习/francis-study-cram"
#   bash setup-github.sh
#
# 如果你把文件夹搬到别处了（推荐），先 cd 进新位置再运行。

set -e

cd "$(dirname "$0")"

# 清理 Claude sandbox 残留的 git 锁文件
# 说明：Claude Code 的 sandbox 环境有时异常退出后会留下 .lock 文件，
# 导致 git 操作报 "index.lock exists" 错误。这些文件只是锁标记，
# 删除后不影响 git 数据完整性。2>/dev/null + || true 确保即使文件不存在也不报错。
rm -f .git/index.lock .git/HEAD.lock .git/objects/maintenance.lock 2>/dev/null || true

# 如果不是 git 仓库（极少见，比如你 clone 走了又删了），重新初始化
if [ ! -d .git ]; then
  echo "==> 没检测到 .git，初始化..."
  git init -b main
  git add .
  git commit -m "Initial commit: francis-study-cram skill plugin"
fi

# 如果有未提交的改动，自动提交
if [ -n "$(git status --porcelain)" ]; then
  echo "==> 检测到未提交改动，自动提交..."
  git add -A
  git commit -m "Update plugin content"
fi

# 如果已经有 origin remote，直接 push；否则建 repo
if git remote get-url origin > /dev/null 2>&1; then
  echo "==> 已配置 remote，直接 push..."
  git push -u origin main
else
  echo "==> 在 GitHub 创建 public repo francis-study-cram 并推送..."
  gh repo create francis-study-cram \
    --public \
    --source=. \
    --push \
    --description "AI 学习助教：日常学习 + 考前冲刺双模式，专为全英文授课、考论述题的大学生设计"
fi

echo ""
echo "✅ 完成！repo 地址："
gh repo view francis-study-cram --json url -q .url
