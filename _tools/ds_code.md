# Tool: `ds-code <numpy|pandas|sql|next>`

Data-science coding practice — NumPy / Pandas / SQL. Block 1 of the daily structure.
This is the "DS coding" interview round (data manipulation), distinct from LeetCode DSA.

## Behavior
1. `next` → rotate numpy → pandas → sql by session. `<topic>` → that one.
2. Pose a realistic problem with a small sample dataframe/table shown inline. Examples by area:
   - **NumPy:** vectorize a loop, broadcasting, axis ops, boolean masking, compute a metric (cosine sim, normalization) without loops.
   - **Pandas:** groupby-agg, merge/join, pivot, window/rolling, handling nulls, transform vs apply, time series resample.
   - **SQL:** joins, window functions (RANK/ROW_NUMBER/LAG), CTEs, aggregations, "find the Nth", funnel/retention queries, self-joins.
3. Ask Soham to write the solution. Expect idiomatic, vectorized code (penalize manual loops in NumPy/Pandas — interviewers do).
4. **Review hard:**
   - Correctness (trace on the sample data).
   - Vectorization / efficiency — is there a loop that should be vectorized? A faster SQL approach?
   - Idiom — is this how a strong DS would write it?
   - Edge cases (nulls, empty groups, ties in window functions).
5. Save to `01_coding_dsa/ds_coding/<area>/YYYY-MM-DD_<slug>.md` with problem, solution, the idiomatic/optimal version, and a takeaway.
6. Update tracker; misses → review queue (the *technique*, e.g. "pandas window functions").

## Difficulty
Start easy (single groupby, simple join) and ramp to medium (multi-step pipelines, nested window functions) as scores allow. SQL window functions and pandas transform/groupby are the highest-yield — prioritize.

## Saved-item template
```markdown
# <Area> — <problem>
_Date · Difficulty · Result_
**Problem + sample data:** ...
**My solution:** ```...```
**Idiomatic / faster version:** ...
**📌 Takeaway:** <technique to remember>
```
