# Flashcards — Gradient Boosting / XGBoost

Q: In gradient boosting, what does each new tree fit?
A: The negative gradient of the loss w.r.t. the current prediction. For squared loss that's the residual (y − F). Generalizes to any differentiable loss.

Q: Why is it called "gradient" boosting?
A: Each tree moves the prediction in the direction of the negative gradient of the loss — it's gradient descent in function space.

Q: Are boosting trees competing (good ones rewarded, bad penalized)?
A: No. They're additive and corrective — each tree fixes the errors the current ensemble still makes.

Q: What does the learning rate η do in boosting?
A: Scales each tree's contribution (Fₘ = Fₘ₋₁ + η·hₘ). Small η stops any tree dominating → better generalization (paired with more trees).

Q: What does XGBoost add over vanilla GBM?
A: Second-order Taylor expansion (gradient + Hessian) for splits, plus regularization baked into the objective.

Q: What are the three regularization terms in XGBoost's objective?
A: γ·T penalizes number of leaves; λ·Σwⱼ² is L2 on leaf weights; α·Σ|wⱼ| is L1 on leaf weights. All on LEAF WEIGHTS, not input features.

Q: Boosting vs bagging — what does each reduce?
A: Bagging/RF averages independent trees → reduces variance. Boosting sequentially corrects errors → reduces bias.
