# Progress Log

> Append-only. One row per session item. Powers trend analysis + spaced repetition scheduling.

| Date | Pillar | Topic | Mode | Difficulty | Score /10 | Time | Next review | Key gap |
|---|---|---|---|---|---|---|---|---|
| 2026-06-22 | — | Setup | init | — | — | — | — | System created. Diagnostic pending. |
| 2026-06-22 | ML Theory | Bias-variance / regularization | diagnostic | Medium | 5/10 | — | 2026-06-23 | Lists levers, no *mechanism*; confused overfitting (variance) with data bias/outliers; missed capacity reduction + more data. |
| 2026-06-22 | ML Theory | XGBoost / gradient boosting internals | diagnostic→teach | Medium | 3/10 | — | 2026-06-24 | RESUME TOPIC. Wrong model (trees compete/boosted); didn't know "gradient"=neg grad of loss; unaware reg = γ leaves + L1/L2 on leaf weights. Taught fully. Must re-drill. |
| 2026-06-22 | RecSys | Two-stage architecture (cand gen → ranking) | diagnostic | Medium | 8/10 | — | 2026-06-29 | Strong: recall vs precision framing, latency. Gaps: didn't quantify infeasibility (cheap vs expensive model), wrongly tied ranking-only to cold-start. |
| 2026-06-22 | RecSys | Two-tower model internals | diagnostic | Medium | 8/10 | — | 2026-06-26 | Excellent serving answer. Gaps: didn't name dot-product/tower independence as the precompute enabler; MISSED negative sampling (in-batch, sampled softmax, logQ) — the key training concept. |
