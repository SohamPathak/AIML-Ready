# Tools — how Claude runs each command

These files define the behavior of each practice command. When Soham types a command (e.g. `drill embeddings`),
Claude reads the matching tool file and follows it exactly. This keeps every session consistent and adaptive.

| Command | Tool file | Purpose |
|---|---|---|
| `plan` | [plan.md](plan.md) | Compute today's session from the tracker. |
| `drill <topic>` | [drill.md](drill.md) | Interview Q&A with rubric grading. |
| `code <topic\|next>` | [code.md](code.md) | DSA/ML coding problem + review. |
| `flashcards` | [flashcards.md](flashcards.md) | Spaced-repetition recall. |
| `mock <type>` | [mock.md](mock.md) | Timed realistic round + debrief. |
| `case <topic>` | [case.md](case.md) | Interactive system-design/RecSys case. |
| `teach <topic>` | [teach.md](teach.md) | Deep teaching to interviewer-probe depth. |
| `status` | [status.md](status.md) | Show profile + trend. |

**Shared grading rubric (all evaluative modes):** [grading_rubric.md](grading_rubric.md)

**Universal session rules:**
1. Always update `08_tracker/skill_profile.md`, `progress_log.md`, and `review_queue.md` after a graded item.
2. Save each solved item as a self-contained markdown file in the right pillar folder (revision-friendly).
3. Auto-commit at session end (see [commit_protocol.md](commit_protocol.md)).
4. Grading is **interview-tough**. Reward depth (the *why* and *how*), penalize hand-waving.
5. Adapt difficulty per the rules in `skill_profile.md`.
