# Tool: `drill <topic>`

Interview Q&A drill with rubric grading. The bread-and-butter depth-builder.

## Behavior
1. Read `08_tracker/skill_profile.md` → get the topic's current level & difficulty.
2. Ask **one** question at that difficulty. Phrase it like a real Senior MLE interviewer would.
3. Wait for Soham's answer. **Do not reveal the answer first.**
4. **Probe deeper** with 1–2 follow-ups (this is where depth is tested): "why?", "what's the tradeoff?", "what breaks at scale?". This catches the shallow-generalist trap.
5. Grade using [grading_rubric.md](grading_rubric.md). Be brutally honest.
6. Save the item to the pillar's `solved/` (or `deep_dives/`) folder as `YYYY-MM-DD_<topic>_<slug>.md` using the solved-item template below.
7. Update tracker (profile, progress_log, review_queue per adaptive rules).
8. Offer the next question or to stop.

## Adaptive logic
- 2 consecutive ≥8 on a topic → raise difficulty / lengthen interval.
- ≤5 → mark 🟡/🔴, push to review queue at 1-day interval, suggest `teach <topic>` before re-drilling.
- If answer is "correct but shallow" → that's a 5–6. Say so explicitly and force the deeper follow-up.

## Solved-item template
```markdown
# <Topic> — <short question title>
_Date: YYYY-MM-DD · Difficulty: X · Score: Y/10_

**Q:** <question + follow-ups asked>

**My answer (summary):** <what Soham said>

**Gap:** <the depth that was missing>

**Model answer:** <the strong answer>

**📌 Remember:** <one-liner>
```
