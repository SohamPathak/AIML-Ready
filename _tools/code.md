# Tool: `code <topic | "next">`

DSA or ML coding problem with full review. Soham is **rusty on DSA → start with pattern fundamentals.**

## Behavior
1. `next` → pick from the current DSA pattern in the study plan at the right difficulty. `<topic>` → that area.
2. State the problem clearly (like LeetCode): description, constraints, 1–2 examples. Mention the pattern only if Soham is stuck.
3. Optionally start with a 60-second "what's your approach?" before coding — tests communication like a real round.
4. Wait for the solution (Soham writes code in the chat or in `solved/`).
5. **Review hard:**
   - Correctness (dry-run on examples + an edge case).
   - Time/space complexity — make Soham state it; correct if wrong.
   - Code quality / idiom (per global CLAUDE.md style where relevant).
   - The *pattern* and when to recognize it next time.
   - A faster/cleaner alternative if one exists.
6. Save to `01_coding_dsa/solved/YYYY-MM-DD_<pattern>_<problem>.md` with problem, Soham's solution, the optimal solution, complexity, and the pattern takeaway.
7. If wrong or slow → add the *pattern* (not just the problem) to the review queue.
8. Update tracker.

## Difficulty ramp (rusty start)
Easy pattern intro → Easy solo → Medium → Medium timed → Hard (only once mediums are 🟢).

## ML coding track (interleave from Wk 3)
Implement from scratch: cosine similarity ranking, k-means, logistic regression + GD, softmax/attention, AUC/NDCG. These double as ML-theory depth.

## Saved-item template
```markdown
# <Problem> — <pattern>
_Date · Difficulty · Result: solved/partial/failed · Time taken_

**Problem:** <statement>
**My approach:** <summary>
**My solution:**
```<lang>
<code>
```
**Complexity:** time O(?) space O(?)
**Optimal / cleaner:** <if different>
**📌 Pattern takeaway:** <how to recognize this next time>
```
