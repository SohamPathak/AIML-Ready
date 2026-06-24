# Flashcards — SQL Window Functions

Q: What is a window function vs GROUP BY?
A: GROUP BY collapses rows into one per group; a window function computes across rows WITHOUT collapsing — it adds a column, keeping every row.

Q: How do you get the top row per group in SQL?
A: GROUP BY to aggregate, then ROW_NUMBER() OVER (PARTITION BY grp ORDER BY metric DESC), then WHERE rn = 1 (wrap the window in a CTE first).

Q: ROW_NUMBER vs RANK vs DENSE_RANK?
A: ROW_NUMBER = unique 1,2,3 (one winner even on ties). RANK = 1,2,2,4 (ties share, then skip). DENSE_RANK = 1,2,2,3 (ties share, no skip).

Q: Why can't you filter a window function in the same query's WHERE?
A: Window functions are computed AFTER WHERE. Wrap in a CTE/subquery, then filter (e.g. WHERE rn = 1).

Q: How do you compute a running/cumulative total?
A: SUM(col) OVER (PARTITION BY grp ORDER BY date) — adding ORDER BY inside OVER makes the SUM cumulative up to the current row.

Q: What does LAG(col) do? LEAD(col)?
A: LAG = value from the previous row within the window; LEAD = value from the next row. Used for gap/churn/growth ("compare to previous/next").

Q: What does every LAG/LEAD/ROW_NUMBER window REQUIRE?
A: An ORDER BY inside OVER() — "previous"/"next"/"rank" is undefined without an ordering.

Q: For "days since last event", what should the first row per user be — 0 or NULL?
A: NULL — there's no prior event, so the gap is unknown. COALESCE-ing to 0 falsely implies a zero-day gap.
