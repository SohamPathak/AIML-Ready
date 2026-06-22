# Flashcards — Classification Metrics

Q: Why is accuracy a bad metric on imbalanced data (1% positives)?
A: Predicting all-negative gives 99% accuracy while catching zero positives. The majority class dominates, hiding failure on the rare class you care about.

Q: Recall vs precision — definitions?
A: Recall = TP/(TP+FN), of all actual positives how many caught. Precision = TP/(TP+FP), of all flagged how many real.

Q: When do you prioritize recall? When precision?
A: Recall when misses are costly (default, fraud, disease). Precision when false alarms are costly (spam, intrusive alerts).

Q: AUPRC vs ROC-AUC — when to prefer which?
A: AUPRC (PR curve) when positives are rare — ROC-AUC can look optimistic because true negatives dominate. ROC-AUC fine when more balanced.

Q: What is Fβ and when do you use β>1?
A: Fβ weights recall vs precision; β>1 weights recall higher. Use when false negatives cost more than false positives.

Q: Do precision and recall break when the dataset gets larger?
A: No — they're ratios. Numerator and denominator scale together; the rates stay meaningful.

Q: In gradient boosting, why is it called "gradient"?
A: Each tree fits the negative gradient of the loss w.r.t. the current prediction — adding it is a gradient-descent step in function space.
