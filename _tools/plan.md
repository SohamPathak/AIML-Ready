# Tool: `plan`

Compute today's recommended session from the tracker. The adaptive scheduler.
**Enforces the holistic 8hr/day structure in `00_START_HERE/daily_structure.md` (effective 2026-06-23).**

## Behavior
1. Read `skill_profile.md`, `progress_log.md`, `review_queue.md`, `daily_log.md`, `00_START_HERE/study_plan.md`, and `daily_structure.md`.
2. Figure out current week/phase and the case-study rotation slot (A=HLD, B=LLD, C=DS/ML — cycle by day).
3. **Build today as the full 6-block holistic day** (≈8h). All of blocks 1–5 every day; one case study (block 3) every day:
   - **Block 1 — DS Coding** (~1.5h): NumPy/Pandas/SQL problem (rotate the three).
   - **Block 2 — LeetCode** (~1.5h): current DSA pattern, Easy→Medium, 1–2 problems.
   - **Block 3 — Case study** (~2h): today's rotation slot (HLD / LLD / DS-ML).
   - **Block 4 — ML Theory depth** (~1.5h): lowest-scoring 🔴/🟡 topic → `teach` or `drill`. **Due re-drills first.**
   - **Block 5 — Flashcards** (~0.5h): review-queue items due today.
   - **Block 6 — Behavioral** (~0.5h, heavier on weekends): one STAR story.
4. Present as a checklist with exact commands AND time budget per block, e.g.:
   ```
   📅 Today — Wk1 · Day 2 (Mon) · Case slot: A (HLD)
   1. ds-code pandas        ~1.5h  (groupby/merge problem)
   2. code arrays           ~1.5h  (Easy→Medium, hashing)
   3. case design-sony-recs ~2h    (HLD — your differentiator)
   4. drill xgboost (re)    ~1.5h  (due re-drill, was 6/10)  + teach optimization
   5. flashcards            ~0.5h  (8 due)
   6. behavioral: SageMaker migration story  ~0.5h
   ⏱ ~8h
   ```
5. **PROACTIVITY (required):**
   - If invoked mid/late-day and blocks are untouched, flag it: "⚠️ You haven't done DS coding or a case study yet today."
   - Reference yesterday's `daily_log` status — if yesterday LAGGED, open with it: "Heads up: yesterday you skipped LeetCode. Let's not make it two days."
   - Never produce a theory-only plan. Always include coding + a case study.
6. At end of day, update `08_tracker/daily_log.md` (mark each block, set Status, flag ⚠️ LAGGED if blocks 1–5 not all done).
