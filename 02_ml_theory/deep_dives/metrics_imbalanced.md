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

## 📌 Remember
1. Accuracy fails because **majority class dominates** (99% by predicting all-negative).
2. **AUPRC** > ROC-AUC when positives are rare.
3. **F-beta (β>1)** when misses cost more; pick threshold by **business cost**.
4. Precision/recall are **ratios** — dataset size doesn't break them.
