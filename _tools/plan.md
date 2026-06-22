# Tool: `plan`

Compute today's recommended session from the tracker. The adaptive scheduler.

## Behavior
1. Read `skill_profile.md`, `progress_log.md`, `review_queue.md`, and `00_START_HERE/study_plan.md`.
2. Figure out the current week/phase (from the start date in progress_log).
3. Build today's session by priority:
   - **Due reviews first** (anything in review_queue due today/overdue) — spaced repetition wins.
   - **One coding problem** at current DSA level (rusty → patterns).
   - **One depth item** — the lowest-scoring untested/🟡 topic of the current phase → `drill` or `teach`.
   - **Flashcards** to close.
   - **Sundays:** swap the depth item for a `mock` in the weakest pillar.
4. Present as a short checklist with the exact commands to run, e.g.:
   ```
   Today (Wk1 · Day 3):
   1. flashcards            (4 due)
   2. code two-pointers     (Easy→Medium)
   3. teach xgboost-internals  (your weakest theory topic)
   Est: ~90 min
   ```
5. Keep it to 3–4 items. Depth over volume. Adjust load if recent scores show fatigue or fast progress.
