# Day-1 Diagnostic

Purpose: get a real starting signal across pillars so the adaptive engine isn't guessing.
~30–40 min. Answer in your own words; don't look things up — I need to see *your* depth.
I'll grade interview-tough and seed your skill profile from the results.

> Run by replying to the questions in chat. We'll do them in small batches, not all at once.
> This file is the record; results flow into `08_tracker/skill_profile.md`.

## Batch A — ML Theory depth (the key signal for your "no depth" concern)
1. Bias-variance: a model overfits. Walk me through *every* lever you'd pull, and the mechanism by which each one reduces variance.
2. XGBoost is on your resume. Explain how a single tree is built in gradient boosting — what is the "gradient," what does each tree fit, and what do the two key regularization terms do?
3. You have a recommender. Why might AUC look great offline but the model underperform online? Give me two distinct reasons.

## Batch B — RecSys (your differentiator)
4. Why the two-stage (candidate generation → ranking) architecture? What goes wrong if you skip retrieval and rank everything?
5. In a two-tower retrieval model: what are the towers, how is it trained, and how do you serve it at low latency for 50M users?

## Batch C — Coding warm-up (calibrates the rusty-DSA start)
6. (I'll give you one Easy array/hashing problem live — talk me through your approach before coding.)

## Batch D — Behavioral (Senior scope)
7. Tell me about the Vertex→SageMaker migration. What was *your* decision, what was the hardest tradeoff, and how did you measure success?

---
_Scores and gaps get written into the tracker, then `plan` generates your real Day-2 session._
