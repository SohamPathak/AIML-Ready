# Deep Dive — Loss Functions
_From 2026-06-25 drill (MSE/MAE 4/10; cross-entropy taught). Foundational, must-know._

## Regression losses
### MSE (mean squared error)
- Squares the error → a big error (off by 10) contributes 100. **Outliers dominate** → MSE chases them.
- Smooth everywhere → clean optimization. Penalizes large errors more (good when big misses are genuinely worse).
- **Sensitive to outliers.**

### MAE (mean absolute error)
- Linear (|error|) → off by 10 contributes 10. Outliers don't dominate → **robust to outliers**.
- Constant gradient (±1) → can converge slower / less precisely near the minimum.

### Huber loss
- Quadratic for small errors, linear for large → blends MSE's smoothness with MAE's robustness. The classic compromise.

> Pick MAE (or Huber) when data has outliers you DON'T want to chase; MSE when large errors are truly worse and data is clean.

## Classification: why cross-entropy, not MSE
1. **Convexity:** CE + sigmoid/softmax → convex, clean gradient. MSE + sigmoid → non-convex, local minima, gets stuck.
2. **What CE penalizes:** confident WRONG predictions, harshly. True=1, predict 0.01 → -log(0.01)=4.6 (huge); predict 0.99 → -log(0.99)=0.01 (tiny). Measures "surprise at the truth given predicted prob."
3. **Gradient:** CE+sigmoid → gradient simplifies to (pred − target), clean & proportional. MSE's gradient ×sigmoid' VANISHES when outputs saturate near 0/1 → learning stalls.

## Other losses (know they exist)
- **Hinge loss:** SVMs — penalizes points inside the margin.
- **KL divergence:** distance between probability distributions (distillation, VAEs).
- **Focal loss:** down-weights easy examples → for extreme class imbalance (object detection).

## Loss vs Metric (don't confuse — Soham's recurring trap)
- **Loss:** what you OPTIMIZE (differentiable, drives gradient descent).
- **Metric:** what you REPORT/judge (can be non-differentiable, e.g. accuracy, F1, NDCG).
- You can't directly optimize accuracy (not differentiable) → optimize a surrogate loss (cross-entropy), report accuracy.

## 📌 Remember
1. MSE squares → outlier-sensitive, penalizes big misses, smooth. MAE linear → robust, harder near min. Huber = blend.
2. CE for classification: convex w/ sigmoid, punishes confident-wrong via -log, clean (pred−target) gradient; MSE saturates/stalls.
3. Loss = optimize (differentiable); Metric = report (can be non-differentiable).
