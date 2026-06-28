# AIML-Ready — Soham's Senior MLE Interview Prep

> **Goal:** Land a Senior MLE role at Big Tech / strong RecSys team.
> **Core problem to fix:** *"I know a lot of things but lack depth in any."* — every drill here forces depth.
> **Timeline:** 6–8 weeks. **Grading:** Interview-tough, brutally honest.

---

## 📊 Daily Progress Chart

Per-section activity each day. Claude updates this every session.
**Cell legend:** number = best/avg score that day (/10) · ✅ done · ⏸️ deferred (owed) · ⬜ not touched.

| Day | DS-Code | LeetCode | Case (HLD/LLD/DS) | ML Theory | Flashcards | Behavioral | Day status |
|---|---|---|---|---|---|---|---|
| 06-22 (setup) | ⬜ | ⬜ | ⬜ | 5⃝ (diag+drills) | ➖ | ⬜ | Setup |
| 06-23 | ⬜ | ⬜ | ⬜ | 7 (XGBoost) | ⬜ | ⬜ | Partial |
| 06-24 | 6 pandas, 7 SQL×2 | ⏸️ Two Sum | ⏸️ HLD started | 6→8 (SGD,L1/L2) + 8 A/B | 8/7/7 ✅ | ⬜ | Strong day |
| 06-25 | 7 pandas merge | ⏸️ | ⬜ | 4 loss fns (taught) | ⬜ | ⬜ | Theory+DS |
| 06-26 | ⬜ | ⏸️ | ⬜ | BCE + AUC/AUPRC refresh | ⬜ | ⬜ | Theory |
| 06-28 | ⬜ | ⏸️ | 🟡 6 MOCK (anomaly) | ⬜ | ⬜ | ⬜ | First sys-design mock! |

### Section progress (latest level per topic)
| Section | Status | Recent movement |
|---|---|---|
| 🟢 RecSys | 2 topics interview-level (8/8) | two-stage, two-tower solid |
| 🟢 XGBoost | 7 — nearly ⭐ | 3→6→7 over 3 sessions |
| 🟢 L1/L2 reg | 8 — fixed | 2→4→8, misconception cleared |
| 🟡 SGD/Adam | 6 — improving | 2→6, mechanism needs polish |
| 🟡 Bias-variance | 5 | deep-dive pending |
| 🟡 Imbalanced metrics | 5 | deep-dive pending |
| 🟢 SQL window funcs | 7 — learned from scratch | ROW_NUMBER/RANK/SUM-OVER/LAG in one session |
| 🟢 A/B testing | 8 — new, strong | p-value, practical sig, traps |
| 🟡 Pandas | 6 | reset_index/idxmax pattern learned |
| 🔴 LeetCode/DSA | untested | Two Sum owed (deferred 06-24) |
| 🟡 System Design | 6 — LEAN HIRE (1 mock) | strong instincts/self-correction; infra vocab + headline metrics to sharpen |
| 🔴 Behavioral | untested | STAR stories pending |

> Full detail: [skill_profile](08_tracker/skill_profile.md) · [daily_log](08_tracker/daily_log.md) · [progress_log](08_tracker/progress_log.md)

---

## How to use this (read once)

This repo is run **with Claude**. You don't study alone — you say what you want and Claude runs a tool.
Open a Claude Code session in this folder and use these commands (just type them in chat):

| You say | What happens |
|---|---|
| `drill <topic>` | Claude asks you interview Q&A on a topic, you answer, it grades you on a rubric, logs the score. |
| `flashcards` | Rapid spaced-repetition recall on concepts due today. |
| `code <topic or "next">` | A DSA/ML coding problem at your current level; you solve, Claude reviews correctness + complexity + style. |
| `mock <type>` | A timed, realistic mock round (coding / ml-theory / system-design / recsys / behavioral) + debrief. |
| `case <topic>` | A system-design or RecSys case study, walked through interactively. |
| `teach <topic>` | Claude teaches a concept to the depth a Senior interviewer probes, then quizzes you. |
| `status` | Shows your skill profile, what's improving, what's weak, what's due. |
| `plan` | Shows today's recommended session based on your progress. |

The exact behavior of each command lives in [`_tools/`](_tools/) — these are the "tools" that teach and evaluate you.

---

## The 6 pillars (Senior MLE @ Big Tech + RecSys)

| # | Pillar | Folder | Why it matters for you |
|---|---|---|---|
| 1 | Coding / DSA | [`01_coding_dsa/`](01_coding_dsa/) | Gating round. You're rusty → rebuild patterns → speed. |
| 2 | ML Theory & Fundamentals | [`02_ml_theory/`](02_ml_theory/) | Where "no depth" hurts most. Forced deep-dives. |
| 3 | ML System Design | [`03_ml_system_design/`](03_ml_system_design/) | Your highest-leverage selling point. |
| 4 | RecSys Specialization | [`04_recsys_specialization/`](04_recsys_specialization/) | Your differentiator. Sony LIV @ 50M users = your story. |
| 5 | MLOps & GenAI | [`05_mlops_genai/`](05_mlops_genai/) | Strong already; convert breadth → crisp talking points. |
| 6 | Behavioral / Staff Narrative | [`06_behavioral_staff/`](06_behavioral_staff/) | Senior bar = scope, influence, impact. |

Mock interviews live in [`07_mock_interviews/`](07_mock_interviews/). Your adaptive progress lives in [`08_tracker/`](08_tracker/).

---

## The adaptive engine

Everything you do updates [`08_tracker/skill_profile.md`](08_tracker/skill_profile.md) and [`08_tracker/progress_log.md`](08_tracker/progress_log.md).
- Topics you nail → difficulty goes **up**, revisit interval **lengthens**.
- Topics you miss → they go into a **review queue** and come back sooner (spaced repetition).
- The daily `plan` is computed from this — so the plan literally evolves with your speed.

## Daily loop

1. `plan` → see today's session.
2. Do the work (`drill` / `code` / `case` / `mock` / `flashcards`).
3. Claude grades, logs, updates your profile, and **auto-commits to GitHub**.
4. Weekly: a `mock` in your weakest pillar + a progress review.

## Revision-friendly by design

Every solved item is saved as a small self-contained markdown file with: the question, your answer, the ideal answer, the gap, and a one-line "remember this." Skim any folder to revise fast.
