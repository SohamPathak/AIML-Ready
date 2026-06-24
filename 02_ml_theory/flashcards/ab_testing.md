# Flashcards — A/B Testing

Q: Why does randomization let an A/B test claim causation?
A: It makes control and treatment statistically equivalent on average across all characteristics, so the change is the only systematic difference → metric moves are caused by it.

Q: What does a p-value of 0.04 actually mean?
A: If the treatment did nothing (null true), there's a 4% chance of seeing a result this extreme or more. NOT "96% chance the feature works."

Q: Primary metric (OEC) vs guardrail metric?
A: OEC = the one metric you optimize, committed before the test. Guardrails = metrics that must not regress (latency, crashes, unsubscribes).

Q: Statistical vs practical significance at 50M users?
A: At huge scale almost everything is statistically significant; the real question is practical — is the effect size big enough to justify the cost/complexity?

Q: What is "peeking" and why is it a problem?
A: Repeatedly checking results and stopping at first p<0.05. p-values fluctuate, so peeking inflates false positives. Fix: fix sample size/duration upfront or use sequential methods.

Q: What are novelty/primacy effects in A/B testing?
A: Users react to a change's newness (extra clicks) or confusion (less engagement); it fades. A short test measures the temporary reaction, not steady state. Run longer; split new vs returning users.

Q: What is statistical power and what's it typically targeted at?
A: Probability of detecting a real effect if one exists; usually targeted at 80%. It drives the required sample size; underpowered tests give false negatives.
