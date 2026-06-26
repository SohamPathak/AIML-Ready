# Deep Dive — Metrics for Imbalanced Classification
_From 2026-06-22 drill (5/10). Ties to Soham's default/anomaly detection work._

## Why accuracy fails on imbalance (THE point)
With 1% positives, predicting "all negative" → **99% accuracy** while catching **zero** positives.
Accuracy is dominated by the majority class, so it hides total failure on the rare class you care about.

## Precision vs Recall (ratios — do NOT break with dataset size)
- **Recall (TPR / sensitivity)** = TP / (TP + FN) = of all actual positives, how many caught. Maximize when **misses are costly** (default, fraud, disease).
- **Precision** = TP / (TP + FP) = of all flagged, how many real. Maximize when **false alarms are costly**.
- Trivial to game one alone: flag everyone → recall = 100%. So you need a balance or a cost-based threshold.

## What to use instead of accuracy
- **PR curve / AUPRC** — precision vs recall across thresholds. **Preferred over ROC-AUC when positives are rare** (ROC can look optimistic because TN dominates).
- **ROC-AUC** — threshold-independent ranking quality; fine when classes are more balanced.
- **F1** = harmonic mean of P and R. **Fβ** with β>1 weights recall higher (use when misses cost more — e.g., defaults).
- **Choose the operating threshold by business cost**: cost(FN) vs cost(FP).

## Interview framing (90s)
> "Accuracy is misleading under imbalance — predicting all-negative gives 99% while catching nothing. I'd separate precision and recall, summarize with **AUPRC** (better than ROC-AUC when positives are rare), and set the threshold by the **cost of a false negative vs false positive**. For default detection a miss is expensive, so I'd weight recall higher — an **F-beta with beta>1**."

## AUC-ROC — what it is + the trap (added 2026-06-26)
- ROC plots **TPR (recall) vs FPR** across ALL thresholds. **AUC = P(model ranks a random positive above a random negative)**. 0.5=random, 1=perfect.
- Better than accuracy: **threshold-independent**, measures class *separation*, looks at both classes.
- ⚠️ **TRAP:** FPR = FP/(FP+TN). Under SEVERE imbalance, the huge TN dilutes FPR → ROC-AUC looks **deceptively good** even with many false positives. → prefer **AUPRC**, since precision (TP/(TP+FP)) exposes false positives directly.

## BCE (Binary Cross-Entropy) — added 2026-06-26
Formula (single): `-[ y·log(ŷ) + (1-y)·log(1-ŷ) ]`, ŷ = predicted prob of class 1.
- `y`/`(1-y)` = on/off switch → only the true class's term is active (y=1 → -log(ŷ); y=0 → -log(1-ŷ)).
- `-log` → as predicted prob for the true class → 0, loss → ∞. **Punishes confident-wrong harshly.**
- It's the **negative log-likelihood of a Bernoulli** → principled MLE choice; pairs with sigmoid for a clean convex gradient.

## 📌 Remember
1. Accuracy fails because **majority class dominates** (99% by predicting all-negative).
2. AUC-ROC = threshold-independent ranking quality, but **AUPRC > ROC-AUC under severe imbalance** (ROC's FPR diluted by huge TN).
3. **F-beta (β>1)** when misses cost more; pick threshold by **business cost**.
4. Precision/recall are **ratios** — dataset size doesn't break them.
5. **BCE** = -[y·log ŷ + (1-y)·log(1-ŷ)]; `-log` punishes confident-wrong; = Bernoulli NLL.
