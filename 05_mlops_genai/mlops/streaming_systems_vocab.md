# Streaming & ML Infra Vocabulary (precision cheat-sheet)
_From 06-28 design mock: reasoning was strong, TERMS were fuzzy. Lock these so they come out precise._

## Real-time stream processing
- **Kafka** — the streaming bus / message log. Producers → topics → consumers. Entry point, NOT a compute engine.
- **Stream processing engines** (compute ON the stream): **Apache Flink** (best for low-latency, stateful windowing), **Spark Structured Streaming**, **Kafka Streams**. ← name these for "compute rolling/windowed features in real time".
- **Stateful stream processing** — the engine holds per-key state across events/windows (e.g., rolling error-rate per service over the last N minutes). THIS is the hard part of streaming features; call it out.
- **Windowing** — tumbling (non-overlapping), sliding/hopping (overlapping), session windows. Rolling features = sliding windows.
- **EMR** — a managed *cluster* (Spark/Hadoop) for batch/big-data jobs. Not a streaming engine by itself.

## Stores (use the RIGHT name)
- **Redis** — in-memory key-value store (caching, fast lookups, feature serving). NOT OLAP.
- **OpenSearch / Elasticsearch** — search + analytics engine; good for logs, text, and **vector/ANN search**.
- **OLAP DB** — analytical columnar DB (ClickHouse, BigQuery, Redshift, Druid) for aggregations over large data.
- **Time-series DB** — Prometheus, InfluxDB, TimescaleDB for metrics.
- **Vector index / ANN** — FAISS, ScaNN, HNSW, or OpenSearch k-NN for similarity search (e.g., similar incidents).

## Serving the model
- **SageMaker endpoint** / **EC2 + load balancer (autoscaling)** / **KServe / Triton** for real-time inference.
- Batch scoring: Spark / EMR.

## Monitoring & drift
- **Drift detection** = monitor the model's input feature distribution AND its output score/alert distribution over time (PSI, KL divergence, alert-rate). Knowing WHEN to retrain is half the job — not just "retrain".
- Plus: latency, throughput, alert ack/dismiss rate (real-world FP proxy).

## 📌 Remember for design rounds
Kafka (bus) → **Flink** (stateful windowed features) → **model endpoint** (score) → **store** (Redis/OpenSearch) → business/dedup/prioritization layer → alert. Monitor score distribution for **drift**.
