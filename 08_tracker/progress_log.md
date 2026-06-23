# Progress Log

> Append-only. One row per session item. Powers trend analysis + spaced repetition scheduling.

| Date | Pillar | Topic | Mode | Difficulty | Score /10 | Time | Next review | Key gap |
|---|---|---|---|---|---|---|---|---|
| 2026-06-22 | — | Setup | init | — | — | — | — | System created. Diagnostic pending. |
| 2026-06-22 | ML Theory | Bias-variance / regularization | diagnostic | Medium | 5/10 | — | 2026-06-23 | Lists levers, no *mechanism*; confused overfitting (variance) with data bias/outliers; missed capacity reduction + more data. |
| 2026-06-22 | ML Theory | XGBoost / gradient boosting internals | diagnostic→teach | Medium | 3/10 | — | 2026-06-24 | RESUME TOPIC. Wrong model (trees compete/boosted); didn't know "gradient"=neg grad of loss; unaware reg = γ leaves + L1/L2 on leaf weights. Taught fully. Must re-drill. |
| 2026-06-22 | RecSys | Two-stage architecture (cand gen → ranking) | diagnostic | Medium | 8/10 | — | 2026-06-29 | Strong: recall vs precision framing, latency. Gaps: didn't quantify infeasibility (cheap vs expensive model), wrongly tied ranking-only to cold-start. |
| 2026-06-22 | RecSys | Two-tower model internals | diagnostic | Medium | 8/10 | — | 2026-06-26 | Excellent serving answer. Gaps: didn't name dot-product/tower independence as the precompute enabler; MISSED negative sampling (in-batch, sampled softmax, logQ) — the key training concept. |
| 2026-06-22 | ML Theory | XGBoost re-drill | drill (re) | Medium | 6/10 | — | 2026-06-24 | Improved 3→6. Got sequential/corrective structure. Still says fits "loss" not "negative gradient"; did not explain WHY "gradient" (=GD in function space). One word off. |
| 2026-06-22 | ML Theory | Metrics on imbalanced data | drill | Medium | 5/10 | — | 2026-06-24 | Correct recall vs precision defs + right business call. But didn't say WHY accuracy fails (majority class → 99% by all-negative); wrong claim that dataset size breaks precision/recall (they're ratios); missed AUPRC/F-beta/cost-based threshold. |
| 2026-06-22 | ML Theory | SGD vs Adam | drill | Medium | 2/10 | — | 2026-06-24 | MISCONCEPTION: thinks SGD "searches all minima" (it's directed gradient descent on mini-batch); Adam ≠ "removes positive-slope steps". Missing momentum + adaptive per-param LR. Taught. |
| 2026-06-22 | ML Theory | Regularization / L1 sparsity | drill | Medium | 2/10 | — | 2026-06-24 | MISCONCEPTION: confused regularization (penalizes weight magnitude) with loss (penalizes error). Didn't address L1 sparsity. Taught L1 const-push vs L2 prop-push + diamond geometry. |
| 2026-06-23 | ML Theory | XGBoost (full teach L1-L4) | teach | Medium | 7/10 | — | 2026-06-25 | BREAKTHROUGH: now owns "residual=negative gradient → GD in function space" after 3 attempts (3→6→7). Got γ=#leaves, λ=L2 on leaf weights, 2nd-order Taylor. Re-drill to confirm retention. |
| 2026-06-24 | ML Theory | SGD vs Adam re-drill | drill (re) | Medium | 6/10 | — | 2026-06-26 | 2→6. Misconception GONE (stochastic=mini-batch ✓, fixed LR ✓, named both Adam pieces). Fuzzy on HOW each works: momentum=EMA past grads, adaptive=÷√(EMA sq grads) per-param. |
| 2026-06-24 | ML Theory | L1 vs L2 re-drill | drill (re) | Medium | 4/10 | — | 2026-06-25 | 2→4. Got "penalizes complexity" but REVERTED to "acts on error" (L1=abs error, L2=sq error) — it's abs/sq of WEIGHTS not error. Didn't explain sparsity. RE-TAUGHT w/ constant-vs-proportional gradient. Re-drill 06-25 (priority). |
| 2026-06-24 | ML Theory | L1 vs L2 re-drill #2 | drill (re) | Medium | 8/10 | — | 2026-06-27 | 4→8 SAME SESSION after re-teach. Misconception GONE: penalizes WEIGHTS (|w| vs w²), derivative +1/-1=constant pull (L1) vs 2w=proportional (L2). Only missing: stating sparsity outcome aloud. |
| 2026-06-24 | DS Coding | Pandas: max entity per group | ds-code | Easy-Med | 6/10 | — | 2026-06-27 | Derived the strategy himself (groupby-sum→idxmax→loc) — good. Tripped on missing .reset_index() (MultiIndex Series) and iloc vs loc. Pattern saved. |
