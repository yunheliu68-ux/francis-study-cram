# 四类商科子模板（学科自动识别 + 输出格式）

UK 商学院模块虽然都挂在 Business School 下，但**答题套路完全不同**。Skill 必须自动识别学科类型，套用对应模板。

---

## 学科自动识别（关键词驱动）

| 信号词 | 判定 |
|---|---|
| `supply / demand / equilibrium / GDP / inflation / growth model / IS-LM` | **Econ** |
| `claimant / defendant / statute / case law / tort / contract / employment law / discrimination` | **Law-flavoured** |
| `motivation / leadership / performance / appraisal / HRM / equity theory / JCM` | **Management** |
| `regression / SPSS / p-value / significance / forecasting / inventory / queuing / optimisation` | **Quant** |

**判定流程：** 扫 lecture slide 前 10 页 + module handbook，统计哪类词频最高 → 该模块归入该子类。同一模块允许两个子类（如 Econ + Quant）。

**Tie-breaking 规则（当两类词频接近时）：**
1. **Module handbook 声明的学科优先**：如果 handbook 明确写明 "This module is part of the Economics programme"，即使 Law 关键词也多，仍归入 Econ。
2. **Assessment 类型辅助判断**：如果考试是 IRAC 格式 → Law-flavoured；需要 SPSS output → Quant；纯 essay + model → Econ/Management。
3. **仍无法区分时默认双标签**：标记为 `discipline: econ+quant`，讲解时叠加两套模板，按题目类型切换。

---

## Econ 模板（适用：ECO212 Development Economics 等）

**答题三件套：模型 + 图 + 直觉**

### 每道题必走 5 步（Cram 模式强制 checklist；Daily 模式下 Step 2-5 适用，Step 1 背景故事可省）

1. **背景故事**：这个模型/理论是谁提出的（作者+年份）、解决什么真实问题
2. **答题骨架 + 分值拆解**：这道题 30 分 → definition 5 + model 10 + application 8 + critique 7
3. **关键金句**：考官一眼看到"对题了"的那句话（如 "The Solow model predicts conditional convergence"）
4. **必带例子**：lecture 提过的具体 case（China's growth, Sub-Saharan Africa poverty）
5. **失分提醒**：这题最容易丢分的地方（没画图 / 只讲一个理论不讲对立面）

### 答 Essay 题结构

```
1. Define the concept（一句话，用 textbook definition）
2. Present the model
   - 写出关键 equation / framework（如 Solow growth model: Y = K^α(AL)^(1-α)）
   - 画图（必须！没图扣分。用文字描述图：横轴/纵轴/曲线/均衡点）
3. Explain the intuition
   - 用直觉语言讲为什么模型这么走
4. Apply to context
   - 举一个 lecture 提过的 case（如 China's growth, Sub-Saharan Africa poverty）
5. Critically evaluate
   - 模型的 assumption 是什么？
   - 哪些 assumption 不现实？
   - 有什么替代理论？（如 Solow vs Endogenous Growth）
6. Conclusion: which view is more persuasive and why
```

### 关键红线

- ❌ 没画图（哪怕用文字描述也要画）→ 直接扣 critical analysis 分
- ❌ 只讲一个理论不讲对立面 → 没有 critique
- ❌ 用 "I think the economy will grow" 之类的口语 → 必须 hedge："empirical evidence suggests..."
- ❌ 把 model 当成 fact → 永远说 "the Solow model predicts..."，不要说 "growth IS..."

---

## Law-flavoured 模板（适用：SMO207 Business Law / Employment Law 等）

**答题框架：IRAC-lite**（简化的法学经典框架）

### 每道题必走 5 步（Cram 模式强制 checklist）

1. **背景故事**：这个 legal principle 形成的背景（如 Donoghue v Stevenson 开创了 negligence duty of care）
2. **答题骨架 + 分值拆解**：Issue 5 + Rule 10 + Application 10 + Conclusion 5
3. **关键金句**：如 "It is arguable that a duty of care arises under the three-part test in Caparo"
4. **必带例子**：必须引用至少 1 个 statute（带年份+section）或 1 个 case（带[年份]）
5. **失分提醒**：跳过 Issue 直接答案 / 引 case 不写年份 / Application 不分析事实

### 答 Case Study 题结构

```
I — Issue（问题识别）
   - 这个 case 的核心法律问题是什么？
   - 涉及哪一类法律（contract / tort / employment）？

R — Rule（规则陈述）
   - 适用的法律原则是什么？
   - 引用具体的 statute（如 Employment Rights Act 1996 s.94）
   - 或先例 case（如 Donoghue v Stevenson [1932]）

A — Application（应用到本案）
   - 把规则套用到 case 事实上
   - 这里是答题主体（占 50% 篇幅）
   - 必须 reason，不能跳步

C — Conclusion（结论）
   - 谁赢？为什么？
   - 哪个 remedy？damages / injunction / unfair dismissal claim?
```

### 关键红线

- ❌ 跳过 Issue 直接答案 → marker 找不到你的 reasoning
- ❌ 引 statute 不写年份和 section → 不算 citation
- ❌ 引 case 不写 [年份] → 同上
- ❌ "I would rule that..." → 不许第一人称，用 "It can be argued that..."
- ❌ 应用部分不分析事实 → 这是核心扣分点

---

## Management 模板（适用：SMO202 HR / Performance Management / Leadership 等）

**答题三件套：Framework + Critique + Case**

### 每道题必走 5 步（Cram 模式强制 checklist）

1. **背景故事**：这个 framework 的提出者（作者+年份）、解决什么 management 问题
2. **答题骨架 + 分值拆解**：Identify 5 + Explain 10 + Critique 8 + Apply 7
3. **关键金句**：如 "The JCM (Hackman & Oldham, 1976) posits that five core job dimensions drive intrinsic motivation"
4. **必带例子**：至少 1 个 empirical study 或 lecture 提过的公司案例（Google, Netflix, etc.）
5. **失分提醒**：用 framework 不报名字 / 只讲框架不批判 / "I think X is good" 无理论支撑

### 答 Essay 题结构

```
1. Identify the relevant framework / theory
   - 必须说出名字 + 出处 + 年份
   - 例："The Job Characteristics Model (Hackman & Oldham, 1976)..."
   - 例："Equity Theory (Adams, 1963) suggests that..."

2. Explain the framework
   - Core components / dimensions
   - 如何应用到 HR / management 情境

3. Critically evaluate
   - 提至少 1 个支持的 empirical study
   - 提至少 1 个 critique（例 "However, Smith (2010) argues..."）
   - 讨论 boundary conditions（在什么情境下成立）

4. Apply to a real case
   - lecture 提过的公司案例（Google, Netflix, etc.）
   - 或自己合理推断的情境

5. Synthesis & Conclusion
   - 不要简单选边
   - "While X is useful in Y context, it has limitations in Z"
```

### 关键红线

- ❌ 用 framework 不报名字 → 完全不得分
- ❌ 报名字不报年份/作者 → 扣 citation 分
- ❌ 只讲框架不批判 → 永远拿不到 1st
- ❌ "I think performance management is good" → 必须有理论支撑

---

## Quant 模板（适用：IOM208 Operations + SPSS / Forecasting / 量化分析等）

**答题四件套：Given + Method + Result + Interpretation**

### 每道题必走 5 步（Cram 模式强制 checklist）

1. **背景故事**：这个方法/模型在 business 语境下解决什么问题（如 ARIMA 用于 demand forecasting）
2. **答题骨架 + 分值拆解**：Given 5 + Method 10 + Calculation 8 + Interpretation 7
3. **关键金句**：如 "A 1-unit increase in X is associated with a β-unit change in Y, holding all else constant"
4. **必带例子**：具体数字 + 单位，不能只写公式不代入
5. **失分提醒**：算完没单位 / 只贴 SPSS 截图不解读 / 把 correlation 说成 causation / 没有 managerial implication

### 答数据 / 计算题结构

```
1. Given / Data
   - 列出已知数据
   - 说明数据类型（time series / cross-sectional）

2. Method
   - 说明用什么模型/方法（regression, ARIMA, EOQ, etc.）
   - 为什么选这个方法（assumption check）
   - 写出公式

3. Calculation / SPSS Output
   - 完整 working steps
   - 单位必须写
   - 如果是 SPSS：贴关键 output（coefficients table, R², p-value, F-stat）

4. Interpretation（核心扣分点）
   - 数字背后的 business meaning 是什么
   - p < 0.05 → "the relationship is statistically significant at 5% level"
   - 不要只说 "X affects Y"，要说 "a 1-unit increase in X is associated with β-unit change in Y"

5. Managerial implication
   - 这个结果对决策有什么影响
```

### 关键红线

- ❌ 算完没单位 → 扣分
- ❌ 只贴 SPSS 截图不解读 → 没有 interpretation 分
- ❌ 把 correlation 说成 causation
- ❌ p-value 反着读（p < 0.05 不是 "95% chance the effect is real"）
- ❌ 没有 managerial implication → 商科 quant 必须落回 business 语境
