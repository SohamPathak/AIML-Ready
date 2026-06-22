# Deep Dive — Gradient Boosting & XGBoost
_Taught 2026-06-22 after a 3/10 diagnostic. RESUME TOPIC — must reach ⭐._

## The one-sentence intuition
Builds trees **sequentially**; each new tree predicts the **errors the current ensemble still makes**. Like golf putts correcting the remaining distance.

## Mechanism
1. Start with base prediction F₀ (mean / log-odds).
2. **Gradient** = derivative of loss L(y, F) w.r.t. the current prediction F. For squared loss, −gradient = `(y − F)` = the **residual**.
3. Fit the new tree to the **negative gradient** (general → works for any differentiable loss; residual is just the squared-loss special case). This is **gradient descent in function space.**
4. Add it scaled by learning rate: `Fₘ = Fₘ₋₁ + η·hₘ`. Small η → no tree dominates → generalizes better.
5. Repeat for M trees.

**XGBoost extras:** second-order Taylor expansion (uses gradient **and Hessian**) for split decisions; regularization baked into the objective.

## The objective
```
Obj = Σ L(yᵢ, ŷᵢ) + Σ Ω(treeₖ),   Ω = γ·T + ½λ·Σwⱼ² + α·Σ|wⱼ|
```
- **γ·T** → penalizes # leaves T (drives pruning, simpler trees).
- **λ·Σwⱼ²** → L2 on **leaf weights** (output values), shrinks them, smoother.
- **α·Σ|wⱼ|** → L1 on leaf weights, can zero them.
> Note: reg is on **leaf weights**, NOT input features. (Common confusion.)

## Boosting vs Bagging (RF)
- RF = parallel, independent trees, **averages → reduces variance**.
- Boosting = sequential, corrective, **reduces bias**. More accurate, more overfit-prone, harder to parallelize.

## Key hyperparameters
`n_estimators` × `learning_rate` (trade), `max_depth`, `subsample`/`colsample_bytree` (stochastic reg), `γ`, `λ`, `min_child_weight`.

## 90-second interview answer
> "Trees built sequentially; each fits the **negative gradient of the loss** w.r.t. current prediction — residual for squared loss, but generalizes to any differentiable loss. Add each scaled by a learning rate. XGBoost uses a **second-order** approximation (gradient + Hessian) and regularizes the objective: **γ on #leaves, L1/L2 on leaf weights**."

## 📌 Remember
1. Fits **negative gradient** (= residual for L2). "Gradient" = ∂loss/∂prediction. Gradient descent in function space.
2. Trees are **additive & corrective**, not competing.
3. Reg: **γ→#leaves, λ→L2 leaf weights, α→L1 leaf weights.**
