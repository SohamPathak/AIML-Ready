# Deep Dive — SGD vs Adam
_From 2026-06-22 drill (2/10, misconception). Must-know-cold for MLE._

## Clear up the misconception
SGD does NOT "search all minima." It computes the **gradient** (slope of the loss) and steps **downhill**.
"Stochastic" = the gradient is estimated from a **mini-batch**, not the full dataset. It's directed descent, not search.

## SGD
`w ← w − η · g`  (g = mini-batch gradient, η = fixed global learning rate)
Problems:
- **One LR for all parameters** — bad when features differ in scale/frequency.
- **No memory** — oscillates in ravines, crawls on flat regions.

## Adam = Momentum + Adaptive per-parameter LR
- **1st moment (momentum):** EMA of past gradients → smooths path, accelerates flats, damps oscillation. (Ball with inertia.)
- **2nd moment (adaptive LR):** EMA of *squared* gradients; divide step by its sqrt → big-gradient params get smaller steps, rare/small-gradient params get bigger steps → **per-parameter learning rate**.
- (Plus bias correction on the moment estimates early in training.)

## When to use which
- **Adam:** fast convergence, robust to LR choice → default for deep nets / quick iteration.
- **SGD (+ momentum):** often **generalizes better** for large-scale vision; common in final/production training with LR schedules.

## 90s answer
> "SGD takes a fixed-size step down the mini-batch gradient with one global learning rate. Adam adds momentum — an average of past gradients — and adaptive per-parameter learning rates scaled by recent squared gradients, so it converges faster and is less sensitive to LR tuning. SGD with momentum sometimes generalizes better, so it's still used with schedules."

## 📌 Remember
1. SGD = **directed mini-batch gradient descent**, NOT search. "Stochastic" = mini-batch.
2. Adam = **momentum (1st moment) + adaptive per-param LR (2nd moment)**.
3. SGD+momentum can generalize better; Adam converges faster/easier.
