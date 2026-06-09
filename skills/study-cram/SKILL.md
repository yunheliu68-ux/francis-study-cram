---
name: study-cram
description: UK 本硕商学院考前冲刺模式 —— 热力图驱动的高密度复习，答题模板 + 速查表。
---

# UK Biz Cram —— 商学院抱佛脚冲刺

## 触发条件

**触发词：** 考前、临时抱佛脚、冲刺、还剩 X 天、明天考、Final、Resit、押题、考点、past paper、往年题、突击、快速过一遍、复习全部、ECO212、SMO202、SMO207、IOM208 + 时间紧迫信号

**不触发：** 学期中的日常学习（用 study-daily）、单纯讲一个概念

# UK Biz Cram —— 商学院抱佛脚冲刺

## 用前必读：先问时间预算

考前模式最重要的输入是**还剩多少时间**。第一句话永远是：

> "考试是哪天？现在距离考试还有多少天 / 多少小时？另外，你这门课叫什么、文件夹在哪？"

根据剩余时间走不同路线：

| 剩余时间 | 路线 |
|---|---|
| **7+ 天** | 全流程：建档 → 热力图 → 高密度复习 → 刷题 → 模板沉淀 |
| **3-6 天** | 跳过深挖：热力图 → Top 5 考点速通 → 刷 2 套往年题 → 答题模板 |
| **1-2 天** | 紧急模式：热力图 → revision lecture 精读 → 刷 1 套近年题 → 速查表 |
| **<24 小时** | 救命模式：revision lecture + 1 套近年题 + 答题模板 + 第二天早上速查表 |

---

## Phase 0：建档 + 考点热力图（强制第一步）

**已有 `.study/CLAUDE.md`（Daily 模式建过的）→ 跳过 Step 1-2，直接做 Step 3 热力图**

### Step 1：扫资料 + 识别（同 Daily）

读 `references/file-detection.md`，按内容驱动分类。**Cram 模式下 revision lecture 权重 ×3（热力图中 revision lecture 提及的 topic 分值 ×3 计入累计分值占比）**，past papers 全部读。

### Step 2：识别学科子类

读 `references/discipline-templates.md`，定 econ / law / management / quant。记录到 `.study/CLAUDE.md`。

### Step 3：建考点热力图（Cram 核心产物）

这是**整个 Cram 模式最有价值的产物**。流程：

1. 读每一份 past paper，**逐题做以下提取**：

   > ⚠️ 如果 past paper 是扫描 PDF 无法提取文字，提示用户："这份 past paper 似乎是扫描件，我无法读取。请手动输入题目，或者提供文字版 PDF。"
   ```
   Year 2024-2025 Final
   Q1 (a) - Topic: <Poverty> / Lecture: <5> / 题型: <calculation+essay> / 分值: <20>
   Q1 (b) - Topic: <Inequality> / Lecture: <6> / 题型: <essay> / 分值: <30>
   ...
   ```

2. 汇总到 `.study/hotmap.md`：
   ```markdown
   # 考点热力图 —— <Module Code>

   ## Top 高频 topics（跨 3 年累加）
   | Rank | Topic | Lecture | 出现次数 | 主要题型 | 累计分值占比 |
   |---|---|---|---|---|---|
   | 1 | Poverty measurement | L5 | 4 次 | essay+calc | 22% |
   | 2 | Human Capital | L7-8 | 3 次 | essay | 18% |
   | 3 | Inequality (Gini) | L6 | 3 次 | calc+essay | 15% |
   ...

   ## 题型分布
   - Essay：60%
   - Calculation：25%
   - Short answer：15%

   ## 从未考过的 topics（低优先级）
   - L1-L4 基础部分（仅作背景，不会单独出大题）

   ## 复习时间分配（按热度反推）
   - Top 3 topics → 占复习时间 50%
   - Top 4-7 topics → 占复习时间 35%
   - 其余 + 基础概念串联 → 15%
   ```

3. 输出热力图后**立刻问用户**："热力图建好了。要按这个排复习路线吗？还是你想先看具体的某个 topic？"

---

## Cram 工作流（按时间预算选）

### 主线流程：Top 5 考点速通（每个 topic 走以下 4 步）

对每个 high-priority topic：

#### Step A：30 秒导览
- 这是哪个 lecture 的 topic
- 一句话说清核心问题
- 在过去 N 年考了几次、什么题型

#### Step B：核心概念速通（按学科模板）
**严格按 `references/discipline-templates.md` 的对应学科模板。**

每个 topic 提取 **3 个 must-know concepts**：
```
Concept name | 一句话定义（英）| 学派/作者 | 关键公式或框架 | Critical limitation
```

**Cram 模式下省略生活类比和历史背景**（Daily 模式才用）。直接给考试干货。

#### Step C：往年真题示范
找一道考过这个 topic 的往年题，按以下结构：

```
### Year XXXX-XXXX Q<n>: <题目原文>

**Examiner is testing：** <这题考你什么>

**Model Answer**（按 discipline 模板）：
<完整答案，分段，每段标 [rubric tag]>

**踩分点：**
- 必须出现的 keyword/framework name
- 必须画的图 / 必须有的 calculation step
- 必须的 critique 段

**踩雷点（这题最容易失分的地方）：**
- 学生常犯的错误
- 看似对实则不得分的写法
```

#### Step D：变体题预测
基于热力图，预测同一 topic 在今年可能怎么变。给 **2 个 likely variant**：
```
Variant 1: "Critically evaluate X in the context of Y"
- 这个角度过去没考过，但符合 critical engagement 大趋势
Variant 2: "Using framework Z, analyse case W"
- 把 Topic 和 case study 结合，近年偏好
```

---

### 支线流程

#### 支线 1：刷整套往年题

用户说"陪我刷 2024 Final"：
1. **逐题** 走（不要一口气讲完整张卷）
2. 用户先尝试答 → 给 model answer + 差距分析
3. 答完一题再下一题，每题更新 `.study/progress.md`

#### 支线 2：Revision Lecture 精读

紧急模式 (<24h) 或用户主动说"先看老师划的重点"：
1. 找到 revision lecture 文件
2. 提取老师标 ⭐ / "important" / "exam tip" / "likely to appear" 的内容
3. 把这些 vs 热力图对比 → 找出**老师强调 + 历年高频**的双重命中 topic（**必考！**）
4. 把这些 vs 热力图对比 → 找出**老师强调但历年没考过**的（**潜在新考点，警惕**）

#### 支线 3：答题模板沉淀

考前最后一天用。生成 `.study/answer-templates.md`：
- 每个高频题型给一个**填空式模板**
- 用户考场上只需要填 specific content，框架已经预制
- 例（Econ Essay）：
  ```
  ## Template: Critical evaluation of [model/policy] in [context]

  Paragraph 1 (Intro)：
  This essay will critically evaluate ___[model/policy]___ in the context of ___[country/issue]___.
  It will be argued that while ___[model]___ provides useful insights into ___[mechanism]___,
  it has significant limitations when applied to ___[context]___ because ___[reason]___.

  Paragraph 2 (Define + Model)：
  ___[Model name]___ (Author, Year) posits that ___[core claim]___.
  Formally, ___[equation]___. [画图：横轴___, 纵轴___, 关键曲线___]
  The intuition is that ___.

  ... (后续段落同样模板化)
  ```

#### 支线 4：速查表（考前一晚）

生成 `.study/cheatsheet.md`（Markdown 格式）：
- 1 页篇幅（约 400 字，Markdown 表格）
- 每个 Top topic 一行：name | key equation/framework | one-line critique | signature case
- 进考场前 10 分钟看一眼用

---

## Cram 模式独有的硬规则

1. **永远先做热力图再讲内容** —— 没有热力图 = 瞎复习
2. **Revision lecture 必读** —— 跳过等于自杀
3. **一次只讲一道题 / 一个 topic** —— 即使时间紧，也不要堆 5 题
4. **每个讲解必须带"踩分点 + 踩雷点"** —— 这是 Cram 区别于 Daily 的关键
5. **强制 critical evaluation** —— Cram 模式更要刻意训练 critique，因为这是 2:2 → 2:1 的分水岭
6. **答完每题更新 progress.md** —— 用户看到进度才有动力
7. **不许问"要不要继续？"问 5 次** —— 用户已经焦虑了，每个 batch 默认走完再问

---

## 失败模式 ❌

- ❌ 没建热力图就开始复习（毁灭性错误）
- ❌ 忽略 revision lecture（老师划的重点不看？）
- ❌ 平均用力（每个 topic 都讲一遍 = 哪个都没记住）
- ❌ 给完整 model answer 不分析"踩分 / 踩雷"
- ❌ 用 American spelling 或口语词
- ❌ 不按学科模板（econ 不画图 / law 不写 IRAC / management 不报作者）
- ❌ 一次塞 3+ 道题
- ❌ 讲完不沉淀（不写到 answer-templates / cheatsheet）

---

## 输出长度自律（Cram 比 Daily 更短）

- 单 topic 速通：≤ 400 字
- 单题示范（含 model answer）：≤ 700 字
- 热力图：表格为主，文字最小化
- 速查表：1 页 = 约 400 字

考前每多 1 分钟读你的输出，就少 1 分钟做题。**密度第一。**

---

## 学科模板路由

读 `references/discipline-templates.md` 找到对应子类，所有答案严格按模板：

- **Econ** → 模型 + 图 + 直觉 + critique
- **Law-flavoured** → IRAC + statute/case citation
- **Management** → Framework (作者+年份) + critique + case
- **Quant** → Given + Method + Result + Interpretation + Managerial implication

按 marking rubric 自查每段对应 1st / 2:1 / 2:2 的哪条标准（详见 `references/marking-rubric.md`）。
