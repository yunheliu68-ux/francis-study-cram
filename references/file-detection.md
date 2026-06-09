# 文件识别规则（内容驱动，不靠文件名）

UK 商学院的资料文件名极其混乱。同一份 module handbook 可能叫 `mhb.docx` / `Module_Handbook.docx` / `moudle handbook+考试形式+作业要求.docx`。试卷文件名可能因保存乱码或人工命名导致格式不一。

**核心原则：用内容判断文件类型，不要相信文件名。**

---

## 五大文件类型 + 识别信号

### 1. Module Handbook（模块手册）—— 最高优先级

**识别信号**（命中 ≥2 条即判定）：
- 出现 "module code"、"module title"、"credit"、"learning outcomes"、"assessment"、"marking criteria"、"weighting"
- 包含考试形式说明（"final exam"、"coursework"、"weighting 60%"）
- 中文资料可能写 "考试形式"、"成绩占比"、"评分标准"

**为什么重要：** 老师在这里**明文写出**考什么、怎么打分、各部分占多少。比任何 lecture 都重要。

### 2. Lecture Slides（讲义）—— Canon 主体

**识别信号：**
- 文件名或内容含 `Week X` / `Lecture X` / `L1-L12` / `Seminar X`
- 多为 PDF 或 PPTX，每页一个 topic
- 含 "Learning objectives" / "Today's agenda" / "Outline"

**特殊变体：**
- **PPTX + PDF 并存** → PPTX 版可能含动画/notes，信息更全；PDF 是发布版。**两个都读，PPTX 优先**。
- **同一周多个版本**（`_v2`、`_final`、`_Updated`）→ **取最新日期/版本号**。
- **Guest Speaker / 客座讲座** → **必读**，往往直接出考点。

### 3. Revision Lecture / Final Review（复习课）—— 金矿，权重拉到最高

**识别信号**（任一命中即判定）：
- 文件名含 `revision` / `review` / `revisit` / `final review` / `summary`
- 文件名含 "Week 12" / "Week 13" 且在 lecture 文件夹（学期末复习课）
- 内容是对整学期 topic 的浓缩 + "exam tips" / "重点"

**为什么重要：** 老师亲口划重点。**Cram 模式权重 ×3（热力图中 revision lecture 提及的 topic 分值 ×3 计入累计分值占比）**，Daily 模式不优先看（避免提前剧透）。

### 4. Tutorial / Seminar / Lab（练习材料）

**识别信号：**
- 文件名含 `Tutorial` / `TTL` / `Seminar` / `Workshop` / `Lab` / `Worksheet` / `Week X Tutorial`
- 内容是 questions / problems / case study

**关键操作：题答配对**
- 同名带 "Answer" / "Solution" / "Walkthrough" 的 → 配成 (Q, A) 对
- 单独的 Answer 文件夹（如 `Answers for the W1-10 Tutorials`）→ 按 Week 号自动配对应题目
- 如果只有答案没有题、或只有题没有答案，标记为不完整

**特殊文件：**
- `.sav` / `.csv` / `.xlsx` 数据文件 → 量化模块的 Lab 数据，需要 Quant 模板处理
- `Walkthrough` / `Discussion` 文件 → 老师带做的解析，价值极高

### 5. Past Papers（往年试卷）—— 第二金矿

**识别信号**（不要靠文件名）：
- **内容含**：模块代码 + "Examination" / "考试" / "Final" / "Resit" / "Section A/B/C" / "Question 1"、时间限制、题号
- 多为 3-15 页 PDF，结构为问题列表
- 可能含 "READ THE INSTRUCTIONS CAREFULLY" / "Time allowed"

**Final vs Resit 判断：**
- 文件名/内容含 `F` / `Final` → 正考
- 文件名/内容含 `R` / `Resit` → 补考（题型相似但题目不同，**同样有价值**）
- 文件名含 `S1` / `S2` → Semester 1 / 2

**关键产物：考点热力图**
- 提取每道题的考察 topic
- 横轴 = Week / Lecture，纵轴 = 出现次数
- 跨年份累加 → 排出 Top 5 高频考点 = 复习优先级

---

## PDF 大文件分批读取策略

扫描阶段遇到大型 PDF 时，按以下策略分批读取，避免一次性吞入导致截断或超时：

| PDF 页数 | 策略 | 说明 |
|---|---|---|
| **≤ 10 页** | 直接全文读取 | 小文件无需分批 |
| **11-50 页** | 每批 20 页 | 分 2-3 批读完，每批记录提取到的类型信号 |
| **> 50 页** | 先读前 5 页 + 目录页 + 最后 3 页 | 超长文件（如完整 textbook）先定位结构，再按需深读相关章节 |

**执行规则：**
- 每批读取后立即判断文件类型（handbook / lecture / tutorial / past paper / revision），不要等全部读完再判断
- 如果前 2 批已能确定类型，可跳过剩余批次
- Past paper 必须全文读完（题目可能分散在不同页），不可跳页
- Lecture slide 前 10 页 + 最后 2 页通常足以提取 topic 列表和 learning objectives

**PDF 文字提取优先路径（3 步 fallback）：**
1. **先试 `pdftotext`**：`pdftotext -layout <file.pdf> -` → 如果返回有效文本，直接用（最干净）
   - 批量处理：`for f in *.pdf; do pdftotext -layout "$f" "${f%.pdf}.txt"; done`
   - ⚠️ `pdftotext not found` ≠ `pdftoppm not found`，这是两个不同工具，别搞混
2. **Read 工具**：如果 pdftotext 不可用或返回空/乱码 → 用 Read 工具读取（大多数扫描件有 OCR 文本层）
3. **提示用户**：如果 Read 也失败 → "这份文件我无法读取文字。请手动输入题目，或者截图发给我。"

**题目含内嵌图形时：**
- 如果题目包含图表/图形但 OCR 抓不到 → 告诉用户："这题里的图我看不到，方法论我先讲，**请你截图发我**，我对照真实图重答精确版本。"
- 不要在没有图的情况下猜测图形内容

---

## Phase 0 标准扫描流程

```
1. 列出根文件夹的所有文件 + 子文件夹
2. 对每个文件：读前 2-3 页（PDF）或前 200 行（docx/txt），判断类型
   ↑ 这是"类型识别"阶段，只为了判断文件属于 handbook/lecture/tutorial/past paper/revision 哪一类
   ↑ 大文件的完整读取策略见上方"PDF 大文件分批读取策略"
3. 按类型分桶：
   - handbook/ → 优先解析，提取评估方式 + topic 列表
   - lectures/ → 按 Week 编号排序，提取每周 topic
   - tutorials/ → 配对 Q & A
   - past-papers/ → 按年份排序，提取题目 + topic 归类
   - revision/ → 单独标记
4. 输出（写到模块根目录的 .study/ 文件夹）：
   - .study/CLAUDE.md     ← 模块概览 + 评估方式 + 用法说明
   - .study/topics.md      ← Week × Topic 映射表
   - .study/hotmap.md      ← 考点热力图（仅 Cram 模式自动生成）
   - .study/glossary.md    ← 关键术语英中对照（边学边累积）
   - .study/progress.md    ← 学习进度（Daily 创建，Cram 也会读写）
```

**输出文件夹用 `.study/` 而不是 `study/`** —— 隐藏文件夹避免污染用户资料目录。

---

## `.study/` 共享数据格式约定（Daily 与 Cram 共用）

两个 skill 共享 `.study/` 文件夹，以下是每个文件的字段约定，确保 Daily 建档后 Cram 能无缝读取：

| 文件 | 创建者 | 读取者 | 关键字段 |
|---|---|---|---|
| `CLAUDE.md` | Daily | Cram | `discipline`, `assessment`, `exam format`, `学习模式` |
| `topics.md` | Daily | Cram | `Week`, `Topic`, `Lecture file`, `Tutorial`, `Status` |
| `glossary.md` | Daily | Cram | `English Term`, `中文理解`, `First seen`, `关键句` |
| `progress.md` | Daily | Cram | `Week`, checkbox items, `✅已掌握`, `🟡仍混淆`, `🔴易丢分`, `🔮待预测`, `🔄 跨会话待办` |
| `hotmap.md` | Cram | Cram | `Rank`, `Topic`, `Lecture`, `出现次数`, `主要题型`, `累计分值占比`, `热度(🔴🟠🟡🟢)` |
| `answer-templates.md` | Cram | Cram | 按题型分段的填空式模板 |
| `cross-paper-summary.md` | Cram | Cram | 跨卷对照表（topic × 年份），压缩到40-50% |
| `cheatsheet.md` | Cram | Cram | 1页A4极简版，每行一个 Top topic |

**Cram 读取 Daily 数据时**：如果 `.study/CLAUDE.md` 已存在，跳过 Step 1-2，直接用已有 `discipline` 和 `topics` 数据建热力图。
