# Flashcards — Loss Functions

Q: Why is MAE more robust to outliers than MSE?
A: MSE squares errors, so a large error is amplified (off by 10 → 100) and dominates the loss; MAE is linear (→10), so outliers don't dominate.

Q: Trade-off of MSE vs MAE for optimization?
A: MSE is smooth everywhere → clean optimization, penalizes big errors more. MAE has a constant ±1 gradient → robust but slower/less precise near the minimum.

Q: What is Huber loss?
A: Quadratic for small errors, linear for large — blends MSE's smoothness with MAE's outlier robustness.

Q: Why use cross-entropy instead of MSE for classification?
A: CE+sigmoid/softmax is convex with a clean gradient; MSE+sigmoid is non-convex (gets stuck) and its gradient vanishes when outputs saturate near 0/1.

Q: What does cross-entropy penalize most?
A: Confident WRONG predictions. True=1, pred=0.01 → -log(0.01)=4.6 (huge); pred=0.99 → ~0.01 (tiny).

Q: Difference between a loss and a metric?
A: Loss = what you optimize (must be differentiable). Metric = what you report/judge (can be non-differentiable, e.g. accuracy, F1). Optimize a surrogate loss, report the metric.

Q: When would you use focal loss or hinge loss?
A: Focal loss for extreme class imbalance (down-weights easy examples). Hinge loss for SVMs (penalizes points inside the margin).
