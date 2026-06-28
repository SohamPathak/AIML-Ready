# Mock — ML System Design (interviewer-led, cross-questioning)
_Date: 2026-06-28 · Type: HLD system design · Bar: Senior MLE · Signal: 🟡 LEAN HIRE (6/10)_

## Prompt
Design a real-time anomaly detection system for a large microservices platform
(thousands of services emitting logs + metrics, ~50k events/sec). Goal: detect
incidents early, reduce time-to-detection, minimize false alarms. Labels are sparse,
delayed, manual (a few hundred past incident tickets with severity + free-text RCA).

---

# Part 1 — The conversation (Soham's answers, grammar cleaned, substance unchanged)

**Q (Interviewer): Where do you want to start?**

**A (Soham):** I'd like to understand the problem a little better. What kind of tagging
is available for an incident at this point — is it manual, or are incidents automatically
tagged based on their severity?

> *Interviewer: Mostly manual and sparse — tickets filed after the fact with a severity
> (SEV1/2/3) and approximate timestamps. No clean per-event anomaly label. ~a few hundred
> documented incidents over the last year.*

**Q: Given labels are sparse, delayed, and noisy — is this supervised? Walk me through your framing.**

**A:** I see — so we're dealing with sparse and imbalanced data, so supervised modeling
might not be possible. I'd also like to know if we have any contextual information about
the tickets.

> *Interviewer: Yes — each ticket has free-text description, affected service(s), severity,
> and sometimes a root-cause note. Logs are semi-structured (timestamp, service, level,
> message); metrics are standard time series (latency, error rate, CPU, memory, RPS).*

**Q: Commit to an approach. What's the ML formulation, and what are you modeling, at what granularity?**

**A:** I'm thinking of converting the raw text data into meaningful key-value pairs from
both logs and metrics, creating features, and using an Isolation Forest.

**Q1: Why Isolation Forest specifically? What do you give up vs an autoencoder or a statistical baseline?**

**A:** Isolation Forest has roughly O(n) time complexity, which suits real-time anomaly
detection, and it works well on smaller/sparse datasets.

**Q2: "Features of what"? What's your unit of detection?**

**A:** I'd go for per-incident detection since it's easy to aggregate up in granularity.
Per-service makes RCA backtracking harder. But since we have event-level information, we
should go per-event.

> *Interviewer pushback: "per incident" can't be an input unit — an incident is the OUTPUT.
> And per-event is too noisy (a single ERROR line is meaningless; anomalies emerge from
> rate/pattern). Reconsider the unit.*

**Q3: A point-wise outlier detector has no notion of time/sequence. Incidents are temporal and cascade. How do you handle that?**

**A:** That can be handled by baking in time (lag and rolling) and topology (hierarchy of
service → API → functional group) features.

> *Interviewer: those rolling/lag features only make sense over a time window — so the unit
> must be (service, time-window), not per-event. Resolve it; give me one concrete feature vector.*

**A (self-correction):** I think I need to change my approach — the window should be at the
per-service level for a given time window. Features: service name, API name, delta change in
CPU usage over the last few windows, cumulative error counts over the last t, t-1, t-2 windows.

> *Interviewer: Yes — unit = (service, time-window). Notes: say "time windows" not "incidents";
> service/API are high-cardinality categoricals (don't one-hot raw — embed/encode).*

**Q4: Given sparse/imbalanced labels, how do you EVALUATE this offline and online?**

**A:** Since this is biased data, I'd use a balanced metric — AUPRC — which isn't fooled by
the large number of true negatives the way ROC-AUC is. Online, I'd use a feedback loop /
business metrics like error-fix rate.

> *Interviewer: AUPRC ✓. Missed: detection LATENCY (how many minutes before the human-filed
> incident did we flag it) — the headline metric for early detection. Online ack/dismiss rate
> is a good FP proxy ✓.*

**Q5: On-call is drowning in noise. How do you keep this from being another ignored alerting system?**

**A:** Add a post-processing prioritization layer that tells on-call which service to fix
first, plus a mechanism to dedup similar/correlated incidents by topologically sorting them.

> *Interviewer: ✓ Senior answer — one alert for the root service, not 200 downstream alerts.*

**Q6: Walk me from Kafka to the dashboard — where do windowed features get computed, where does the model serve, how does a score become a deduped/prioritized alert?**

**A:** We can compute on EMR over Kafka — fast distributed compute. The Isolation Forest can
live on a managed endpoint like a SageMaker endpoint, or be hosted on EC2 with a load balancer
to autoscale with traffic. Store results in OpenSearch/Redis, on top of which we run ANN search
to find similar incidents. Prioritization is handled by a separate business layer after deduping.

> *Interviewer: Imprecise. "EMR" isn't a streaming engine → Flink / Spark Structured Streaming /
> Kafka Streams; the hard part is STATEFUL windowed stream processing. Redis = in-memory KV, not
> OLAP. ANN-for-similar-incidents idea ✓. Endpoint choice ✓.*

**Q7: 3 months live, a new service / holiday spike makes Isolation Forest fire constantly. What's happening, what do you do?**

**A:** Classic data drift — the model's baseline has shifted. We can add seasonality/holiday
features so the model understands the new trend, and retrain.

> *Interviewer: Diagnosis ✓, fix ✓. Missed: how to DETECT drift automatically (monitor the
> model's score/alert distribution over time) so you know when to retrain.*

---

# Part 2 — The most optimal way to solve this design

### 1. Clarify & scope (did this well)
- Labels: sparse, delayed, manual → can't rely on supervised per-event labels.
- Goal: **early detection** (minimize time-to-detect) + **low false-alarm rate** (alert fatigue).
- Scale: ~50k events/sec, thousands of services, real-time (sub-minute) requirement.
- Signals: structured logs + metric time series + a few hundred labeled historical incidents.

### 2. ML problem framing
- **Primarily unsupervised anomaly detection** (no clean labels) on **(service, time-window)** units.
- Use the few hundred labeled incidents NOT for training but for **offline evaluation** (and threshold tuning).
- Optional later: a **weakly/semi-supervised** layer once enough on-call feedback accumulates.

### 3. Unit of detection & features
- **Unit = (service, time-window)** e.g. each service per rolling 1-min window. This is the key decision.
- Features per unit:
  - Metric stats: mean/max/delta of latency, error rate, CPU, memory, RPS over the window + **lag** vs previous windows + **rolling** trends.
  - Log-derived: count by level (ERROR/WARN), rate-of-change, count of rare/new log templates (parse via Drain/log-template mining).
  - **High-cardinality categoricals** (service, API): embed or target/frequency-encode, NOT raw one-hot.
  - **Topology features**: position in dependency graph (upstream/downstream error propagation).

### 4. Model — layered, not just one
- **Baseline:** per-metric statistical detectors (EWMA / robust z-score / seasonal decomposition). Always mention a simple baseline.
- **Core:** **Isolation Forest** (fast, distribution-free, high-dim) OR an **autoencoder** (reconstruction error) on the windowed feature vectors. Isolation Forest is a fine, defensible choice for tabular features.
- **Temporal:** since incidents are sequential, a per-service **forecasting model** (e.g. Prophet/ARIMA/LSTM) flagging large residuals captures "trending bad" — complements the point detector.
- **Correlation layer:** combine per-service anomalies using the **service dependency graph** to find the *root* anomaly.

### 5. Serving & scale (the part to say precisely)
```
Producers → Kafka (logs topic, metrics topic)
          → Flink / Spark Structured Streaming   ← STATEFUL windowed feature computation
          → Model scoring (SageMaker endpoint / KServe / embedded in the stream job)
          → Anomaly store (OpenSearch for search+ANN; Redis for hot feature/state cache)
          → Correlation + dedup + prioritization (business layer, uses dependency graph)
          → Alert to on-call dashboard / PagerDuty
```
- Featurization = **stateful stream processing** (per-service window state) — the genuinely hard part at 50k/sec.
- Dedup: collapse correlated downstream anomalies into one root alert (topological).

### 6. Evaluation & monitoring
- **Offline:** on the few hundred labeled incidents → **AUPRC** (rare positives) + **detection latency** (minutes before human ticket) + alerts-per-day (FP volume). Latency is the headline metric.
- **Online:** on-call **ack vs dismiss rate** (real-world FP proxy), incidents caught by model vs missed, MTTD improvement.
- **Drift:** monitor the **score/alert-rate distribution** over time (PSI/KL); spike or shift → investigate/retrain. Auto-retrain cadence + seasonality features.

### 7. Iteration / tradeoffs
- v1: statistical baseline + Isolation Forest on metrics, single-service alerts.
- v2: add log-template features, topology correlation/dedup, prioritization.
- v3: feedback loop from on-call → weak supervision; forecasting/temporal layer.
- Tradeoff to state: sensitivity vs alert fatigue — tune the threshold by **cost of a missed incident vs an ignored alert** (ties to the metrics/threshold reasoning).

---

## Debrief & hire signal
🟡 **LEAN HIRE / borderline** at Senior bar. Strong instincts & self-correction; gaps were
precision (infra vocab) and a few senior "headline" points (detection latency, stateful
streaming, drift detection). Full debrief: ../debriefs/2026-06-28_system_design_anomaly.md
