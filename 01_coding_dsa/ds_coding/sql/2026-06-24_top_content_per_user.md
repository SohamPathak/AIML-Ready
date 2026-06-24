# SQL — Top-N per group (window functions)
_Date: 2026-06-24 · Block 3 DS coding (SQL) · Result: learned cold w/ teaching · 6/10_

## Pattern: "top row per group" (THE #1 DS-coding SQL pattern)
```sql
WITH totals AS (                                   -- 1. aggregate
    SELECT user_id, content_type, SUM(watch_secs) AS total_secs
    FROM watch_events
    GROUP BY user_id, content_type
),
ranked AS (                                        -- 2. rank within group, no collapse
    SELECT user_id, content_type, total_secs,
           ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY total_secs DESC) AS rn
    FROM totals
)
SELECT user_id, content_type AS top_content_type, total_secs   -- 3. keep winner
FROM ranked
WHERE rn = 1;
```

## Window function = compute across rows WITHOUT collapsing them (unlike GROUP BY)
- `PARTITION BY x` → restart the numbering/ranking per group (like GROUP BY but keeps all rows).
- `ORDER BY y DESC` → rank from highest to lowest.

## ROW_NUMBER vs RANK vs DENSE_RANK
- ROW_NUMBER → 1,2,3,4 unique (one winner even on ties) — use for "exactly one per group".
- RANK → 1,2,2,4 (ties share, then skip) — use for "include all ties".
- DENSE_RANK → 1,2,2,3 (ties share, no skip).

## Why a CTE/subquery? You can't filter a window function in WHERE of the same query (it's computed after WHERE). Wrap it, then filter.

## My bugs to remember
1. `GROUP BY a, b` — comma, NOT `group by a and b` (that groups by a boolean!).
2. Chained CTEs use ONE `with`: `WITH a AS (...), b AS (...)` — don't repeat `with`.
3. `ORDER BY ... DESC` for "highest first" — default is ASC.

## 📌 Remember
Top-per-group = **GROUP BY (aggregate) → ROW_NUMBER() OVER (PARTITION BY grp ORDER BY metric DESC) → WHERE rn=1.**

---

## More window functions (learned 06-24, from scratch)
- **Running total:** `SUM(col) OVER (PARTITION BY grp ORDER BY date)` — ORDER BY inside OVER makes SUM cumulative up to current row.
- **LAG / LEAD:** `LAG(col) OVER (PARTITION BY grp ORDER BY date)` = value from PREVIOUS row (LEAD = next row). For gap/churn/growth ("compare to previous"). First row per group → NULL.
- **RANK vs ROW_NUMBER vs DENSE_RANK:** ROW_NUMBER=unique 1,2,3 (one winner); RANK=1,2,2,4 (ties share+skip); DENSE_RANK=1,2,2,3 (ties share, no skip).

## Recurring syntax bugs to KILL (hit all 3 today)
1. **`group by`** is two words (not `groupby` — pandas habit).
2. **No trailing comma** after the last CTE: `WITH x AS (...)` then straight to final SELECT. Comma only BETWEEN multiple CTEs.
3. **`LAG`/`LEAD`/`ROW_NUMBER` REQUIRE `ORDER BY`** inside OVER() — "previous"/"rank" is meaningless without an order.
4. Window expr is inseparable: `FUNC(col) OVER (...) AS alias` — alias goes LAST, after the whole OVER clause.

## NULL semantics (good instinct, aim it right)
First-row LAG gap should usually stay **NULL** (no prior event) — don't COALESCE to 0, which falsely implies "zero-day gap". COALESCE→0 only when 0 is the true meaning.
