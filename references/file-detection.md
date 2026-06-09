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

**为什么重要：** 老师亲口划重点。**Cram 模式权重 ×3，Daily 模式不优先看（避免提前剧透）**。

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

## Phase 0 标准扫描流程

```
1. 列出根文件夹的所有文件 + 子文件夹
2. 对每个文件：读前 2-3 页（PDF）或前 200 行（docx/txt），判断类型
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
   - .study/progress.md    ← 学习进度（仅 Daily 模式）
```

**输出文件夹用 `.study/` 而不是 `study/`** —— 隐藏文件夹避免污染用户资料目录。
