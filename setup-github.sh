#!/bin/bash
# 一键推到 GitHub。运行前请确认：
# 1. 已安装 gh CLI（macOS：brew install gh）
# 2. 已登录 gh（gh auth login）
#
# 用法：在 Terminal 里
#   cd "/Users/francis/Desktop/ECO212复习/francis-study-cram"
#   bash setup-github.sh

set -e

cd "$(dirname "$0")"

echo "==> 初始化 git 仓库..."
git init -b main

echo "==> 添加文件..."
git add .

echo "==> 首次提交..."
git commit -m "Initial commit: UK Biz Study skill plugin (daily + cram modes)"

echo "==> 在 GitHub 创建 public repo francis-study-cram 并推送..."
gh repo create francis-study-cram \
  --public \
  --source=. \
  --push \
  --description "UK 本硕商学院 AI 学习助教：日常学习 + 考前冲刺双模式"

echo ""
echo "✅ 完成！repo 地址："
gh repo view francis-study-cram --web --json url -q .url 2>/dev/null || gh repo view --json url -q .url
