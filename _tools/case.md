# Tool: `case <topic>`

Interactive case study — **one per day (block 3)**, rotating across three types:
- **HLD** (system design high-level): use the design spine below.
- **LLD** (low-level design): class/API/schema design — objects, interfaces, data structures, edge cases. E.g. rate limiter, LRU cache, feature store schema, a recommendation-serving API.
- **DS/ML case**: open analytical prompts — "metric dropped 10%, debug it", design an A/B test, "how would you model churn", experiment pitfalls. Save these to `09_ds_cases/`.

Pick the type from the day's rotation (A=HLD, B=LLD, C=DS/ML) unless Soham names one.

## Behavior
1. Present an open design prompt (e.g., "Design recommendations for Sony LIV at 50M users"). Default to prompts that map to Soham's resume so answers double as interview stories.
2. Drive it through the **standard spine** (also in `03_ml_system_design/frameworks/`):
   1. Clarify requirements & constraints (scale, latency, objective, online/offline).
   2. Define the ML problem + success metrics (offline + online/business).
   3. Data & features (sources, labels, leakage, freshness).
   4. Model approach (candidate gen → ranking for RecSys; baselines first).
   5. Serving & scale (latency, ANN, caching, fallback).
   6. Eval & monitoring (A/B, drift, guardrails).
   7. Iteration / tradeoffs / what you'd cut for v1.
3. **Make Soham lead.** Ask a step, let him answer, probe, then advance. Don't lecture the whole design.
4. Push on the things real interviewers push on: metric choice, cold start, position bias, train-serve skew, cost.
5. Grade with the rubric; save to `03_..._design/solved/` or `04_recsys.../solved/` as a clean writeup (great revision artifact).
6. Update tracker.
