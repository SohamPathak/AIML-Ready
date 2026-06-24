# Deep Dive — A/B Testing & Causal Inference
_Taught 2026-06-24 (8/10, fresh topic, strong). Critical for RecSys roles + proving Sony LIV impact._

## What it is
Randomized controlled experiment: split users randomly into **control** (old) and **treatment** (new),
measure a metric, decide if the difference is real or noise. **Randomization** makes the two groups
statistically equivalent on average across ALL characteristics → the change is the only systematic
difference → enables **causal** claims, not just correlation.

## Vocabulary (use precisely)
- **OEC / primary metric:** the ONE metric committed to BEFORE the test (e.g. session length).
- **Guardrail metrics:** must-not-regress metrics (latency, crash rate, unsubscribes).
- **Randomization unit:** usually the USER (consistent experience), not the request.

## Is the result real?
- **Null hypothesis:** "no difference; treatment = control."
- **p-value:** P(seeing a result this extreme OR more | null is true). p < 0.05 → reject null → significant.
- ⚠️ **TRAP:** p=0.04 does NOT mean "96% chance the feature works." It's a statement about the data under the null, NOT the probability the hypothesis is true.
- **Power (target ~80%):** probability of detecting a real effect; drives required sample size. Underpowered → false negatives.
- **Practical vs statistical significance:** at 50M users almost everything is statistically significant → ask if the effect size is big enough to justify engineering cost/complexity.

## Traps that invalidate tests
1. **Peeking / early stopping:** repeatedly checking and stopping at first p<0.05 inflates false positives. Fix: fix sample size/duration upfront, or sequential/Bayesian methods.
2. **Multiple comparisons:** testing many metrics → some look significant by chance. Fix: Bonferroni / pre-declare one OEC.
3. **Novelty & primacy effects (big in RecSys):** users react to newness; effect fades. Fix: run long enough for steady state; split new vs returning users.
4. **Network/interference effects:** one user's treatment affects another (social/marketplace). Fix: cluster/geo randomization.

## Interview framing
> "Randomize at the user level, commit to a primary metric + guardrails upfront, power the test for the minimum detectable effect, then judge BOTH statistical and practical significance — and watch for peeking, novelty effects, and interference."

## 📌 Remember
1. Randomization → equivalent groups → causation.
2. p-value = P(data this extreme | null), NOT P(hypothesis true).
3. At scale: practical significance > statistical significance.
4. Traps: peeking, multiple comparisons, novelty, interference.
