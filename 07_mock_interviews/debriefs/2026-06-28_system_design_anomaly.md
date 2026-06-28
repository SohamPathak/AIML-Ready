# Debrief — System Design Mock (Anomaly Detection)
_2026-06-28 · Bar: Senior MLE · Signal: 🟡 LEAN HIRE / borderline_

## Strengths (keep doing)
- Clarified labels/context BEFORE designing — senior behavior.
- **Self-corrected under cross-questioning** (per-event → (service,time-window)). Top positive signal.
- Correct unsupervised framing for sparse/imbalanced labels; AUPRC carried from prior session.
- Topological dedup + prioritization for alert fatigue — genuinely senior product judgment.

## Gaps that capped the score
1. **Imprecise infra vocabulary** (knows the systems, fuzzy terms):
   - Stream compute = Flink / Spark Structured Streaming / Kafka Streams (NOT just "EMR").
   - The hard part = **stateful stream processing** (per-service windowed state).
   - Redis = in-memory KV; OpenSearch = search/analytics; neither is "OLAP". ANN-for-similar-incidents → vector index in OpenSearch / FAISS.
2. **Missed senior "headline" points:**
   - **Detection latency** = the #1 metric for an EARLY-detection product (how many min before the human-filed incident did we flag it).
   - **Drift detection** (monitor the model's score/alert distribution) — not just "retrain".
3. Language slip: kept saying "incident" for "time window" (incident = output, not input unit).

## The fix
Same pattern as theory: reasoning strong, **precision is the gap**. Drill: streaming-systems vocabulary, and always state the one "senior headline" metric/point per design (latency here).

## Re-do target
Re-run a DIFFERENT design prompt within a week; check that infra terms are precise and the unit-of-detection / metric framing is led without prompting.
