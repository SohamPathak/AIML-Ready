# Skill Profile — Soham

> Adaptive map of strengths/gaps. Updated after every session. Levels: 🔴 Weak · 🟡 Developing · 🟢 Solid · ⭐ Interview-ready.
> Difficulty = current question hardness the adaptive engine serves for that topic.

_Last updated: 2026-06-22 (after Day-1 diagnostic, 4 questions graded)_

> **Diagnostic read:** RecSys mechanics are 🟢 interview-level (8, 8). Core ML theory/internals are the real gap (5, 3) — confirms the "breadth not depth" self-diagnosis. Theory depth is the highest-yield focus for Wk 1–2.

## 1. Coding / DSA
| Topic | Level | Difficulty | Notes |
|---|---|---|---|
| Arrays / Hashing | 🔴 untested | Easy | Rusty — start here |
| Two Pointers / Sliding Window | 🔴 untested | Easy | |
| Stack / Queue | 🔴 untested | Easy | |
| Binary Search | 🔴 untested | Easy | |
| Trees / BFS-DFS | 🔴 untested | Easy | |
| Graphs | 🔴 untested | Easy | |
| Heaps / Intervals | 🔴 untested | Easy | |
| DP | 🔴 untested | Easy | Usually the hardest — defer |
| ML coding (k-means, attention, metrics from scratch) | 🔴 untested | Medium | RecSys-relevant |

## 2. ML Theory & Fundamentals
| Topic | Level | Difficulty | Notes |
|---|---|---|---|
| Bias-variance / regularization | 🟡 5/10 | Medium | Knows levers, not mechanisms. Confuses overfit(variance) w/ data bias. Needs `teach` deep-dive. Re-drill 06-23. |
| Regularization mechanism (L1 vs L2 sparsity) | 🟢 8/10 | Medium | 2→4→8. Misconception fixed: penalizes WEIGHTS (|w| vs w²); L1 const pull→sparse, L2 prop pull→shrinks. Polish: state sparsity outcome aloud. Re-drill 06-27. |
| Optimization (GD, Adam, LR schedules) | 🟡 6/10 | Medium | 2→6. Misconception gone. Knows stochastic=mini-batch, both Adam pieces. Needs mechanism precision: momentum=EMA past grads; adaptive=÷√(EMA sq grads). Re-drill 06-26. |
| Loss functions & when to use | 🔴 untested | Medium | |
| Metrics (PR, AUC, ranking metrics) | 🟡 5/10 | Medium | Knows recall/precision defs. Gaps: why accuracy fails on imbalance, AUPRC vs ROC, F-beta, cost-based threshold. Wrong claim re dataset size. Deep-dive needed. |
| Trees/boosting internals (XGBoost) | 🟢 7/10 | Medium | RESUME TOPIC. 3→6→7. Now owns "residual=neg gradient→GD in function space" + γ/λ + 2nd-order Taylor. Re-drill 06-25 to confirm sticks, then ⭐. |
| Neural net internals (backprop, init, norm) | 🔴 untested | Medium | |
| Embeddings & representation learning | 🔴 untested | Medium | RecSys-critical |
| Probability / stats for ML | 🔴 untested | Medium | |

## 3. ML System Design
| Topic | Level | Difficulty | Notes |
|---|---|---|---|
| Design framework (clarify→data→model→serve→eval) | 🔴 untested | Medium | Learn the spine first |
| Feature stores / data pipelines | 🟡 likely-solid | Medium | You've built these |
| Serving / latency / scaling | 🟡 likely-solid | Medium | |
| Monitoring / drift / A-B | 🟡 likely-solid | Medium | You've built these |

## 4. RecSys Specialization (differentiator)
| Topic | Level | Difficulty | Notes |
|---|---|---|---|
| Candidate generation (two-tower, ANN) | 🟢 8/10 | Medium | Strong: recall/precision split. Polish: quantify infeasibility; don't conflate w/ cold-start. |
| Ranking models & strategies | 🟡 likely-solid | Medium | |
| Collaborative filtering / MF | 🟡 likely-solid | Medium | |
| Cold start | 🔴 untested | Medium | Common probe |
| Eval (offline/online, position bias) | 🔴 untested | Medium | |
| Real-time / online learning | 🔴 untested | Hard | |

## 5. MLOps & GenAI (strength → talking points)
| Topic | Level | Difficulty | Notes |
|---|---|---|---|
| Pipelines / CI-CD / retraining | 🟢 strong | Medium | SageMaker migration story |
| RAG / LangChain / agents | 🟡 developing | Medium | Convert to crisp depth |
| LLM eval & inference optimization | 🔴 untested | Medium | Likely gap |

## 6. Behavioral / Staff Narrative
| Topic | Level | Difficulty | Notes |
|---|---|---|---|
| Impact / scope stories (STAR) | 🔴 untested | — | Need polished stories |
| Influence / leadership | 🔴 untested | — | Senior bar |
| Conflict / failure / tradeoffs | 🔴 untested | — | |

---

### Adaptive rules (how Claude updates this)
- Score ≥ 8/10 twice → level up, raise difficulty, lengthen review interval.
- Score ≤ 5/10 → drop to review queue, shorten interval, re-teach before re-drilling.
- "Knows the what but not the why/how" → mark 🟡 and force a deep-dive, not a re-quiz.
