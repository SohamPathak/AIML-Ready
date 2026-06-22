# Flashcards — Optimization & Regularization

Q: What does "stochastic" mean in SGD?
A: The gradient is estimated from a mini-batch of data, not the full dataset. SGD is directed gradient descent, not a search over minima.

Q: What two things does Adam add over plain SGD?
A: (1) Momentum — EMA of past gradients (smooths/accelerates). (2) Adaptive per-parameter learning rates — scale step by sqrt of EMA of squared gradients.

Q: When might plain SGD (with momentum) be preferred over Adam?
A: It often generalizes better (esp. large-scale vision); common in final/production training with LR schedules. Adam converges faster and is easier to tune.

Q: Does regularization penalize error or weights?
A: Weights (their magnitude). Added to the loss as Loss + λ·penalty(w). The loss handles error; regularization handles complexity.

Q: Why does L1 produce sparse weights but L2 doesn't?
A: L1's penalty gradient is a constant push (λ·sign(w)) → drives weights exactly to zero. L2's is proportional to w (2λw) → push vanishes near zero, so weights shrink but never reach zero.

Q: Geometric explanation of L1 vs L2 sparsity?
A: L1 constraint region is a diamond with corners on the axes (optimum lands on a corner → some weights = 0); L2 is a circle with no corners → weights small but nonzero.
