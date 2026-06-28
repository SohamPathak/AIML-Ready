# Mock — ML System Design (interviewer-led, cross-questioning)
_Date: 2026-06-28 · Type: HLD system design · Bar: Senior MLE_

## Prompt
Design a real-time anomaly detection system for a large microservices platform
(thousands of services emitting logs + metrics). Goal: detect incidents/anomalies
early, reduce time-to-detection, minimize false alarms. ~50k events/sec.

## Format
Interviewer cross-questions every choice. Candidate (Soham) leads. No structure handed over.

## Transcript (summary)
Prompt: real-time anomaly detection, microservices, 50k events/sec, sparse/delayed labels.
- Q: clarified labels first (good) → recognized sparse/imbalanced → unsupervised.
- Asked about ticket context (good instinct).
- Chose Isolation Forest. Q1 efficiency ✓. Q2 unit-of-detection: confused "per incident"/"per event" → self-corrected to (service, time-window) under pressure ✓. Q3 lag/rolling+topology features ✓ (right words).
- Q4 eval: AUPRC ✓ (carried from prior session); MISSED detection-latency as headline metric. Online feedback loop ✓.
- Q5 false alarms: prioritization + topological dedup ✓ (senior answer).
- Q6 serving: Kafka→compute→endpoint→store→business layer. Imprecise: "EMR" not a streaming engine (should be Flink/Spark Streaming/Kafka Streams); missed STATEFUL stream processing as the hard part; called Redis "OLAP" (wrong). Endpoint choice fine.
- Q7 drift: correct diagnosis + seasonality features + retrain ✓; missed HOW to detect drift (monitor score distribution).

## Debrief & hire signal
See chat debrief 2026-06-28. Signal: LEAN HIRE / borderline at Senior bar — strong instincts & self-correction, but imprecise infra vocabulary and missed a few "senior" headline points (detection latency, stateful streaming, drift detection).
