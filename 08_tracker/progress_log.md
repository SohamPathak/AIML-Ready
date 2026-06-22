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
