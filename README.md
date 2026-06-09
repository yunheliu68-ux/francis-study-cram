# francis-study-cram —— UK 通用学习助教

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

## 安装

```bash
/plugin marketplace add <你的GitHub>/francis-study-cram
/plugin install francis-study-cram@francis-study-cram
```

---

## 怎么复刻一个你自己的 skill

如果你想做其他学科或场景的 skill（比如法学专属、医学专属、编程面试专属），以下是复刻步骤：

### Step 1：确定场景和触发词

- 这个 skill 解决什么问题？（一句话）
- 用户说什么话应该触发它？（列 10-20 个触发词）
- 什么情况下绝对不该触发？（列 5-10 个反例）

### Step 2：搭文件结构

```
your-skill/
├── .claude-plugin/
│   ├── marketplace.json    ← 告诉 Claude 这仓库里有哪些插件
│   └── plugin.json         ← 插件元数据（名称/版本/作者/license）
├── references/             ← 共享知识（多个 skill 可共用）
│   └── your-reference.md
├── skills/
│   └── your-skill-name/
│       └── SKILL.md        ← 核心！所有 prompt 工程逻辑都在这
├── LICENSE
└── README.md               ← 安装说明
```

### Step 3：写 SKILL.md

SKILL.md 是整个 skill 的灵魂。核心写法：

1. **Frontmatter**：name + description（塞进触发词 + 反触发词）
2. **强制流程**：Phase 0 → Step 1 → Step 2 → ...，用"强制""必须"等绝对语言
3. **输出格式**：外层结构 + 内层结构，用代码块写死模板
4. **正例 + 反例**：每个关键规则都配 ✅ 正例和 ❌ 反例，比单给规则有效 10 倍
5. **失败模式库**：把真实踩过的坑固化成 ❌ 规则，每犯一次错加一条
6. **用户推进信号**：定义"下一个/再深点/跳到X"等交互信号，讲完必须给具体选项

### Step 4：写 marketplace.json 和 plugin.json

**marketplace.json**（仓库级别，列出所有插件）：
```json
{
  "name": "your-marketplace-name",
  "owner": {
    "name": "Your Name",
    "url": "https://github.com/your-username"
  },
  "plugins": [
    {
      "name": "your-skill-name",
      "source": ".",
      "description": "一句话描述",
      "version": "1.0.0",
      "category": "education"
    }
  ]
}
```

**plugin.json**（插件级别）：
```json
{
  "name": "your-skill-name",
  "version": "1.0.0",
  "description": "一句话描述",
  "author": { "name": "Your Name", "url": "https://..." },
  "homepage": "https://github.com/your-username/your-repo",
  "repository": "https://github.com/your-username/your-repo",
  "license": "MIT",
  "keywords": ["触发词1", "触发词2"]
}
```

### Step 5：推到 GitHub + 写安装命令

```bash
/plugin marketplace add your-username/your-repo
/plugin install your-skill-name@your-marketplace-name
```

### 核心心法

> **你不是在写代码，你是在写 Claude 的行为宪法。**
> - 用反例堵死退路（"绝对不要 X" 比 "请做 Y" 有效）
> - 用模板锁死格式（不给 Claude 自由发挥的空间）
> - 用失败模式持续迭代（每踩一次坑就加一条规则）
> - 加新学科只需在 `references/discipline-templates.md` 里加一段，不需要新建 skill

## 文件结构

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
