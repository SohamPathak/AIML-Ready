# Round Calibration — what's actually asked (Senior MLE, Big Tech)

> Target: **Senior MLE at Big Tech, general ML roles** (RecSys is one strong preference, NOT the only focus).
> So prep covers broad ML breadth + the differentiators. Calibrated from web research (2026-06-24).
> Rule: before leveling/choosing topics for any round, check the web for the real format — don't guess. See [[calibrate-to-interview-level]].

## 1. Coding — Python / DSA
- **Level:** LeetCode **easy–medium**. Arrays/hashing, two-pointer, strings, dicts/sets, stack/queue, binary search, basic trees. Hard DP/graphs are rare for MLE.
- **DS-flavored:** NumPy/Pandas data manipulation; "implement X from scratch" (k-means, cosine sim, a metric, gradient step).
- **Watch for:** clean code, complexity stated, talk-aloud.

## 2. SQL
- **Level:** intermediate concept fluency (not puzzles).
- **Concepts:** window functions (ROW_NUMBER/RANK/DENSE_RANK, SUM OVER, LAG/LEAD), joins (INNER/LEFT/RIGHT/FULL), WHERE vs HAVING, GROUP BY, CTEs, COALESCE/NULLs, dedupe via ROW_NUMBER, self-join ("above group average"), pivot via CASE, top-N per group.

## 3. ML Core Concepts (BROAD — not RecSys-only)
Tested for breadth + the *why/mechanism*:
- **Fundamentals:** supervised/unsupervised/semi/RL; overfitting/underfitting; **bias-variance tradeoff**.
- **Regularization:** L1/L2/ElasticNet (penalty on weights; L1 sparsity).
- **Optimization:** GD/SGD/mini-batch, momentum, Adam, learning-rate schedules.
- **Metrics:** precision/recall/F1, ROC-AUC vs PR-AUC, confusion matrix, imbalanced data.
- **Loss functions:** MSE/MAE/Huber, cross-entropy, hinge, KL.
- **Trees & ensembles:** entropy/info gain, pruning, bagging vs boosting, RF, AdaBoost/XGBoost/CatBoost.
- **Classic supervised:** linear/logistic regression (+ assumptions), KNN, SVM (kernel trick), Naive Bayes.
- **Unsupervised:** k-means (choosing k), hierarchical, DBSCAN, GMM; PCA / dimensionality reduction.
- **Feature engineering:** selection, encoding (label vs one-hot), missing values, outliers, scaling, imbalanced (SMOTE/up-down-sampling).
- **DL (if relevant):** backprop, init, normalization, embeddings, attention/transformers.

## 4. ML System Design (the differentiator)
- 7-step spine (clarify → metrics → data → model → serve → eval → iterate). See `03_ml_system_design/frameworks/design_spine.md`.
- RecSys design (strong for Soham) AND general ML systems (fraud/anomaly, ranking, classification at scale, an LLM/RAG system).
- Scale, latency, serving, A/B testing, monitoring/drift.

## 5. Behavioral (Senior/Staff scope)
- Influence/leadership, ambiguity, conflict, failure + learning, measurable impact. STAR. Anchor to Sony LIV / Jio / High Radius.

---
### Coverage priority (given broad-ML target + current gaps)
1. ML core breadth — many topics still untested (clustering, PCA, SVM, loss functions, feature eng). **Highest priority** now that focus is broad.
2. Coding (Python easy–med) + SQL concept fluency — owed Two Sum; SQL going well.
3. ML system design — strong area, build reps.
4. Behavioral — stories not yet drafted.
