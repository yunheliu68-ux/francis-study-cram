# francis-study-cram —— UK 通用学习助教

## ⚡ 30 秒安装

打开终端 → 输入 `claude` 启动 Claude Code → 输入安装命令。

### 方式一：HTTPS（推荐，无需任何配置）

**第一步**：在 Claude Code 中输入（回车执行）：
```
/plugin marketplace add https://github.com/yunheliu68-ux/francis-study-cram.git
```
等待提示成功后，再输入第二步。

**第二步**：
```
/plugin install francis-study-cram@francis-study-cram
```

### 方式二：SSH（需要提前信任 GitHub 指纹）

先在终端运行一次（加入 GitHub SSH 指纹，只需一次）：
```bash
ssh-keyscan github.com >> ~/.ssh/known_hosts
ssh -T git@github.com
```

然后在 Claude Code 中分两步输入：

**第一步**：
```
/plugin marketplace add yunheliu68-ux/francis-study-cram
```

**第二步**：
```
/plugin install francis-study-cram@francis-study-cram
```

---

## 课件读取：让 Claude Code 看到你的学习资料

**Claude Code 运行在你本地电脑上，可以直接读取你电脑上的任何文件。**

### 方式一：在课件文件夹里启动 Claude Code（推荐）

```bash
cd ~/Desktop/ECO212          # 进入你的课件文件夹
claude                       # 启动 Claude Code
/study-cram                  # 启动冲刺模式
```

### 方式二：启动后告诉 Claude Code 路径

```bash
claude                       # 启动 Claude Code
/study-cram                  # 启动冲刺模式
```

然后直接说：
```
我的课件在 ~/Desktop/ECO212，帮我读一下
```

Claude Code 会自动读取该文件夹下的所有课件（PDF、Word、PPTX）。

---

装完后：
- 输入 `/study-daily` → 日常学习模式
- 输入 `/study-cram` → 考前冲刺模式
- 把课程资料文件夹拖进终端（或 `cd` 到资料目录），skill 自动扫描识别

---

一个 Claude Code skill 插件，**跨多门课通用**（不绑定单一学科），专为 UK 本硕场景设计：
日常学习 + 考前冲刺双模式，自动识别学科子类，按英文考试 marking rubric 输出。

架构**通用于任何 UK 论述题 / 案例题 / 计算题为主的本硕模块**（加新学科只需在 `references/discipline-templates.md` 里加一段）。
已在 4 门模块上验证通过：经济学（ECO212）/ 商业法（SMO207）/ HR 管理（SMO202）/ 量化运营（IOM208）。

## 解决什么问题

UK 商学院的学习有几个独特痛点：

1. **Slide 是 canon** —— 考试 70% 出自 lecture slides + revision lecture，不是 textbook。
2. **试卷高度规律** —— 每年 Final + Resit，过去 3 年的题型分布几乎决定今年。
3. **Marking 严格分档** —— 1st / 2:1 / 2:2 / 3rd 每档有明文标准，写之前对着 rubric 写。
4. **Critical analysis 是分数线** —— 复述只能拿 2:2，要拿 1st 必须 evaluate + critique。
5. **资料命名极混乱** —— `mhb.docx` / `Module_Handbook.docx` / `moudle handbook...` 都是同一个东西。

## 两种模式

| 模式 | 触发场景 | 主要产出 |
|---|---|---|
| **Daily**（日常学习） | "今天有 Lecture 5"、"我要预习 Week 3"、"刚上完课，帮我消化一下" | Pre-lecture preview / Post-lecture digest / Tutorial 复盘 / Weekly connector |
| **Cram**（考前冲刺） | "还剩 3 天考试"、"临时抱佛脚"、"帮我把这门课扫一遍" | 时间预算 + 考点热力图 + 高密度复习路线 + 答题模板 + 速查表 |

## 四类学科子模板（按内容自动识别）

| 子类 | 触发关键词 | 典型模块（示例，不限于） | 输出格式 |
|---|---|---|---|
| Econ | supply / demand / GDP / growth model | ECO212 Development Economics、Macro/Micro | 模型 + 图 + 直觉 + critical evaluation |
| Law-flavoured | claimant / statute / case law / tort | SMO207 Business Law、Employment Law | IRAC（Issue / Rule / Application / Conclusion） |
| Management | motivation / leadership / HRM / JCM | SMO202 HR / Performance Management、OB | Framework 名 + 作者 + critique + case |
| Quant | regression / SPSS / p-value / forecasting | IOM208 Operations + SPSS、量化方法 | Given / Method / Result / Interpretation |

> 同一门课可能命中两个子类（例：IOM208 = Management + Quant），skill 会自动叠加模板。
> 加新学科只需在 `references/discipline-templates.md` 里加一段，不需要新建 skill。


```
francis-study-cram/
├── .claude-plugin/
│   ├── marketplace.json
│   └── plugin.json
├── references/                    ← 两个 skill 共享的资源
│   ├── file-detection.md          ← 内容驱动的文件识别（不靠文件名）
│   ├── discipline-templates.md    ← 4 类子学科输出模板
│   ├── marking-rubric.md          ← UK 1st/2:1/2:2 marking criteria
│   └── british-english.md         ← 英式拼写 + academic signposting
└── skills/
    ├── study-daily/SKILL.md      ← 日常学习模式
    └── study-cram/SKILL.md       ← 考前冲刺模式
```
