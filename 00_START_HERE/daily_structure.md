# Daily Structure — 8 hrs/day, holistic (effective 2026-06-23)

> Soham commits **8 hrs/day**. Every day must be holistic — not just theory. Claude is **proactive**:
> sets the day's targets, tracks completion, and **explicitly flags days where Soham lagged.**

## Mandatory daily blocks (every single day)
| # | Block | Time | What |
|---|---|---|---|
| 1 | **DS Coding** | ~1.5h | NumPy / Pandas / SQL. Real data-manipulation problems. Rotate the three. |
| 2 | **LeetCode** | ~1.5h | Easy → Medium. Pattern-based (current DSA pattern). 1–2 problems. |
| 3 | **Case study (1/day)** | ~2h | Rotate: System Design HLD → LLD → DS/ML case. At least ONE every day. |
| 4 | **ML Theory depth** | ~1.5h | `teach`/`drill` the current weak topic. Gap-closing focus (Wk 1–2 heavy). |
| 5 | **Flashcards + review** | ~0.5h | Spaced repetition due items. |
| 6 | **Behavioral** | ~0.5h | STAR story polish (lighter; heavier on weekends). |

Total ≈ 8h. Claude adjusts block sizes by what's weakest, but **all of 1–5 happen daily; case study (3) is non-negotiable daily.**

## Case study rotation (one per day)
- **Day A:** System Design HLD (e.g., design Sony LIV recs, feed ranking, notification system).
- **Day B:** System Design LLD (e.g., design a rate limiter, feature store schema, an LRU cache, class design).
- **Day C:** DS/ML case (e.g., "metric dropped 10%, debug it", A/B test design, "how would you model X").
- Repeat A→B→C.

## Proactivity rules (Claude MUST follow)
1. **At the start of each day**, run `plan` automatically-style: present the day's 6 blocks with concrete tasks.
2. **At the end of each day**, write a day-summary row in `08_tracker/daily_log.md`: which blocks were completed, scores, and **LAGGED flag** for any block not done.
3. **Call out lag explicitly and early:** if a block is being skipped, say so during the session ("⚠️ You haven't touched DS coding today — that's block 1").
4. **Weekly (Sun):** summarize the week — which days were complete, which lagged, the trend, and what to fix.
5. Never let a day pass as theory-only. If Soham only does theory, flag it.

## What "lagged" means
A day is **complete** if blocks 1–5 are all done. Missing any → that day is marked `⚠️ LAGGED` in the daily log with the specific block(s) skipped. Claude reports the running lag count proactively.
