# Deep Dive — Regularization: L1 vs L2 Sparsity
_From 2026-06-22 drill (2/10, misconception). Classic interview question._

## Clear up the misconception
Regularization penalizes **weight magnitude**, NOT error. It adds a term to the loss:
`Total = Loss(y, ŷ) + λ · penalty(w)`. (The loss handles error; the penalty handles complexity.)
Larger λ → simpler model → less overfitting.

## L2 (Ridge) — shrinks, never zeroes
- Penalty: `λ Σ wᵢ²`. Gradient of penalty: `2λw` — **proportional to w**.
- As w → small, the push toward zero → also small. So weights shrink toward zero but **never exactly zero**.

## L1 (Lasso) — drives exact zeros → sparsity
- Penalty: `λ Σ |wᵢ|`. Gradient: `λ · sign(w)` — a **constant push** regardless of w's size.
- Constant pressure drives small weights **exactly to zero** and pins them → **feature selection**.

## Geometric picture (the money explanation)
Minimize loss subject to a weight budget. Constraint region:
- **L1 = diamond** (corners on the axes). Loss contours most likely touch it at a **corner** → some weights exactly 0.
- **L2 = circle** (no corners) → touches at a generic point → all weights small, none exactly 0.

## 90s answer
> "Regularization penalizes weight magnitude, not error. L2 adds λΣw² — its gradient is proportional to w, so the push to zero vanishes near zero: weights shrink but never hit zero. L1 adds λΣ|w| — gradient is a constant sign(w) push, which drives weights exactly to zero, giving sparsity and feature selection. Geometrically, L1's diamond constraint has corners on the axes, so the optimum lands where some weights are zero."

## 📌 Remember
1. Regularization penalizes **weights**, not error.
2. **L1 → constant push → exact zeros → sparse.** **L2 → proportional push → shrinks, never zero.**
3. Geometry: **L1 = diamond (corners on axes), L2 = circle.**
