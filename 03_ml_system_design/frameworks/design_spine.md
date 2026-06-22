# The ML System Design Spine (memorize this)

A reusable 7-step structure. In any design round, narrate which step you're on — it signals seniority.

## 1. Clarify & scope (don't skip — interviewers test this)
- What's the product goal? What does "good" mean to the user/business?
- Scale: # users, QPS, data volume. Latency budget (e.g., <100ms for ranking).
- Online vs batch? Personalized vs not? Existing system to improve or greenfield?
- **State assumptions out loud.**

## 2. Frame the ML problem + metrics
- ML formulation: ranking? classification? retrieval? regression?
- **Offline metrics** (proxy): AUC, NDCG@k, recall@k, MAP.
- **Online/business metrics** (truth): CTR, session length, conversion, retention. Name the guardrails.
- Why these metrics — and where they diverge (the offline/online gap).

## 3. Data & features
- Sources, scale, labels (implicit vs explicit feedback in RecSys).
- Feature types: user, item, context, cross. Freshness/real-time vs batch.
- Leakage, train-serve skew, label delay, negative sampling.

## 4. Model
- **Baseline first** (popularity / logistic reg) — always mention it.
- Then the real approach. For RecSys: **two-stage** = candidate generation (two-tower/ANN) → ranking (DNN/GBDT).
- Justify vs alternatives. Cold start handling.

## 5. Serving & scale
- Retrieval: ANN index (HNSW/ScaNN), embedding store.
- Ranking: feature fetch, model serving, latency budget, caching, fallbacks.
- Real-time features, model refresh cadence.

## 6. Eval & monitoring
- A/B test design (randomization unit, power, guardrails, novelty effects).
- Monitoring: drift (feature/label/prediction), latency, calibration, KPI.
- Shadow / canary / rollback.

## 7. Iteration & tradeoffs
- What ships in v1 vs later. Cost-to-value (your strength — lean into it).
- Failure modes, debt, what you'd do with more time.

> Anchor examples to **Sony LIV (50M users)** and the **Jio log-analyzer** so the design doubles as a behavioral story.
