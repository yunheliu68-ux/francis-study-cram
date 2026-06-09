---
name: study-cram
description: UK 本硕商学院考前冲刺模式 —— 热力图驱动的高密度复习，答题模板 + 速查表。
---

# UK Biz Cram —— 商学院抱佛脚冲刺

## 触发条件

**触发词：** 考前、临时抱佛脚、冲刺、还剩 X 天、明天考、Final、Resit、押题、考点、past paper、往年题、突击、快速过一遍、复习全部、ECO212、SMO202、SMO207、IOM208 + 时间紧迫信号

**不触发：** 学期中的日常学习（用 study-daily）、单纯讲一个概念

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

**已有 `.study/CLAUDE.md`（Daily 模式建过的）→ 跳过 Step 1-2，直接做 Step 3 热力图。但必须先更新 `.study/CLAUDE.md` 中的 `学习模式：Daily` → `学习模式：Cram`，标记已进入冲刺阶段。**

### Step 1：扫资料 + 识别（同 Daily）

读 `references/file-detection.md`，按内容驱动分类。**Cram 模式下 revision lecture 权重 ×3（热力图中 revision lecture 提及的 topic 分值 ×3 计入累计分值占比）**，past papers 全部读。

### Step 2：识别学科子类

读 `references/discipline-templates.md`，定 econ / law / management / quant。记录到 `.study/CLAUDE.md`。

### Step 3：建考点热力图（Cram 核心产物）

这是**整个 Cram 模式最有价值的产物**。流程：

1. 读每一份 past paper，**逐题做以下提取**：

   > ⚠️ 如果 past paper 无法提取文字，按以下 fallback 流程处理：
   > 1. **先尝试用 Read 工具直接提取**——大多数扫描件其实有 OCR 文本层，能自动读取
   > 2. 如果返回空内容或明显乱码 → 提示用户："这份 past paper 似乎是扫描件，我无法读取。请手动输入题目，或者提供文字版 PDF。"
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
   | Rank | Topic | Lecture | 出现次数 | 主要题型 | 累计分值占比 | 热度 |
   |---|---|---|---|---|---|---|
   | 1 | Poverty measurement | L5 | 4 次 | essay+calc | 22% | 🔴 |
   | 2 | Human Capital | L7-8 | 3 次 | essay | 18% | 🟠 |
   | 3 | Inequality (Gini) | L6 | 3 次 | calc+essay | 15% | 🟡 |
   | ... | | | | | | 🟢 |

   **热度分级标准：**
   - 🔴 核心必考（累计分值占比 ≥ 15%）
   - 🟠 高频（10%-14%）
   - 🟡 中频（5%-9%）
   - 🟢 低频（< 5%，考前扫一眼即可）

   ## 题型分布
   - Essay：60%
   - Calculation：25%
   - Short answer：15%

   ## 从未考过的 topics（低优先级）
   - L1-L4 基础部分（仅作背景，不会单独出大题）

   ## 复习时间分配（按热度反推，与时间预算表对齐）
   - Top 3 topics → 占复习时间 50%
   - Top 4-7 topics → 占复习时间 35%
   - 其余 + 基础概念串联 → 15%
   > **与时间预算表的关系**：上方比例是内容优先级，时间预算表（Phase 0 开头的剩余时间路线）是日程粗排。具体到每天干什么，见 Step 5 复习日程表。
   ```

3. 输出热力图后**立刻问用户**："热力图建好了。要按这个排复习路线吗？还是你想先看具体的某个 topic？"

### Step 4：挑题作战图（如果 exam format 是 N-choose-M）

如果 `.study/CLAUDE.md` 中的 `exam format` 是 "N 题选 M 题"（如 "3 out of 5, 2 hours"），热力图建完后**自动生成**选题策略：

```markdown
## 挑题作战图 —— <Module Code>

考试规则：5 题选 3 题，2 小时

| 选项组合 | 覆盖 Topics | 累计分值占比 | 优势 | 风险 |
|---|---|---|---|---|
| **推荐：Q2+Q3+Q5** | Poverty + Human Capital + Inequality | 55% | 三大高频全覆盖 | Q5 可能含计算 |
| 备选：Q1+Q2+Q3 | Growth + Poverty + Human Capital | 48% | 避开计算题 | 丢掉 Inequality |
| 保底：Q2+Q4+Q5 | Poverty + Trade + Inequality | 40% | Trade 是冷门但好写 | 丢掉最高频 Human Capital |

> **注意**：每行"累计分值占比"是该选项组合覆盖的 topics 在热力图中的占比总和，不同组合覆盖不同 topics 所以加总不等于 100%。

**选不出来时的决策规则：**
1. 优先覆盖 Top 3 高频 topics（比"好写"更重要）
2. 避免全选 essay 或全选 calculation——混合型更安全
3. 如果某题只有你强项 topic，即使冷门也选（有信心比高频更重要）
```

如果 exam format 是"全部必答"，跳过此步。

### Step 5：复习日程表（具体到天/小时）

时间预算表只给了粗路线。热力图 + 挑题作战图完成后，**先问用户可用时间**：

> "你的考试是 [日期]，我建议按以下日程排。但你每天大概能学几个小时？有没有哪天完全不能学？"

根据用户回答，生成具体日程表：

```markdown
## 复习日程 —— <Module Code>

考试日期：<日期> | 每天可用：约 X 小时

| 日期 | 时段 | 内容 | 产出 |
|---|---|---|---|
| **Day 1 (1/12)** | 上午 2h | 🔴 Top 1-2 速通 | 笔记：核心概念 3×2 |
| | 下午 2h | 🟠 Top 3-4 速通 | 笔记：核心概念 3×2 |
| **Day 2 (1/13)** | 上午 2h | 刷 1 套往年题 (2024 Final) | 踩分/踩雷清单 |
| | 下午 2h | 🔴 Top 1 变体题 + Revision lecture 精读 | 模板草稿 |
| **Day 3 (1/14)** | 上午 2h | 🟡 Top 5-7 速通 | 答题模板定稿 |
| | 下午 1.5h | 速查表制作 + 模拟默写 | cheatsheet.md |
| | 晚上 0.5h | 速查表最后一遍 | 🎯 进考场 |
```

**排日程规则：**
1. 🔴 核心必考 topics 安排在第一天，确保有消化时间
2. 刷往年题安排在至少 1 个 topic 速通之后（否则刷了也不知道在考什么）
3. 速查表 + 模板沉淀放在最后一天下午
4. 每天留 30 分钟弹性（用户肯定会比计划慢）

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

**Cram 模式下省略生活类比和历史背景**（Daily 模式才用类比层）。直接给考试干货。
✅ 正例（Cram 风格）："The Solow model predicts conditional convergence. Formal: Y = K^α(AL)^(1-α). Critique: assumes closed economy."
❌ 反例（Cram 里禁止）："Solow model 就像跑步机上的人——初期进步快，后期怎么跑都原地踏步"

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
2. **直接给 Model Answer + 踩分/踩雷分析**——Cram 模式时间紧迫，不要求用户先尝试自答（这是 Daily 模式的做法）。用户如果主动想先写，再切换为互动模式
3. 每题更新 `.study/progress.md`

**用户推进信号定义：**
- **"下一题" / "继续"** → 推进到下一题
- **"再深点" / "没听懂"** → 当前题换角度重讲或补充更多踩分点
- **"跳到 Q3" / "跳到 [topic名]"** → 直接跳到指定题目或 topic
- **"换个例子"** → 同一道题换个 application scenario

每题讲完末尾**必须**给出 2-3 个具体选项，如：
> "👉 下一步：① 下一题 Q2(b) ② 这题再深挖 critique 段 ③ 跳到 Q4 Human Capital"

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
8. **卡住的概念必须写回 progress.md** —— Cram 模式下用户说"这个还是不懂"，立即记入 `.study/progress.md` 的 `🔄 跨会话待办`，下次启动时优先处理
9. **焦虑信号响应** —— 用户说"完蛋了""来不及了""我啥也不会""来不及了怎么办"时：
   - ❌ 不说"别紧张""放心""来得及"这种废话
   - ✅ 直接切换最短路径：跳过 Step 5 日程表，从热力图直接进救命路线
   - ✅ 输出压缩：单 topic 速通从 400 字降到 200 字，只给公式/框架/踩分点，砍掉背景和案例
   - ✅ 说一句实话："你的时间不够全覆盖，我现在帮你只抓最高分的部分。"

---

## 失败模式 ❌ + 正例 ✅

- ❌ 没建热力图就开始复习（毁灭性错误）
  ✅ 正例：先输出 hotmap.md，再按排名从高到低讲
- ❌ 忽略 revision lecture（老师划的重点不看？）
  ✅ 正例：revision lecture 中老师标 ⭐ 的 topic + 历年高频 = 双重命中，必考
- ❌ 平均用力（每个 topic 都讲一遍 = 哪个都没记住）
  ✅ 正例：Top 3 topics 占 50% 时间，其余按热度递减
- ❌ 给完整 model answer 不分析"踩分 / 踩雷"
  ✅ 正例：每道 model answer 后紧跟"踩分点：必须出现 X framework + Y case"+"踩雷点：学生常犯 Z"
- ❌ 用 American spelling 或口语词
- ❌ 不按学科模板（econ 不画图 / law 不写 IRAC / management 不报作者）
  ✅ 正例（Law）：Issue → Rule (Employment Rights Act 1996 s.94) → Application → Conclusion
  ❌ 反例（Law）：直接写 "The employee wins because it's unfair"
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
