# UK Biz Study —— UK 本硕商科学习助教

专为 UK 本硕商学院学习场景设计的 Claude Code skill 插件。

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

## 四类商科子模板（自动识别）

| 子类 | 典型模块 | 输出格式 |
|---|---|---|
| Econ（经济学） | ECO212 Development Economics | 模型 + 图 + 直觉解释 + critical evaluation |
| Law-flavoured（商业法） | SMO207 Business & Employment Law | IRAC-lite（Issue / Rule / Application / Conclusion） |
| Management（管理理论） | SMO202 HR / Performance Management | Framework 名 + 出处 + 应用 + critique |
| Quant（量化运营） | IOM208 Operations + SPSS | 数据 / 方法 / 结果 / interpretation |

## 安装

```bash
/plugin marketplace add <你的GitHub>/francis-study-cram
/plugin install francis-study-cram@francis-study-cram
```

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
