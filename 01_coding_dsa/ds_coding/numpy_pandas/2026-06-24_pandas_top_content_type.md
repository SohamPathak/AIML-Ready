# Pandas — Max entity per group ("top content_type per user")
_Date: 2026-06-24 · Block 1 DS coding · Result: solved with hints (2 hints + reset_index fix)_

## Problem
For each user, find the single content_type with the most total watch time. Output user_id, top_content_type, total_secs.

## The pattern (REUSABLE — "max entity per group")
```python
totals = df.groupby(['user_id', 'content_type'])['watch_secs'].sum().reset_index()
result = totals.loc[totals.groupby('user_id')['watch_secs'].idxmax()]
result = result.rename(columns={'content_type':'top_content_type', 'watch_secs':'total_secs'})
```
Steps: **groupby(group, entity).agg() → .reset_index() → groupby(group)[value].idxmax() → .loc[...]**

## What tripped me up
1. **Missing `.reset_index()`** — after a multi-key groupby+sum you get a **Series with a MultiIndex**, not a DataFrame. Further groupby/.loc then misbehaves. Always reset_index to flatten before the next step. ← #1 pandas gotcha.
2. **`idxmax` pairs with `.loc`, NOT `.iloc`.** idxmax returns index *labels*; loc selects by label. iloc (position) is the wrong tool and breaks on non-range indexes.
3. `.max()` loses the label (gives the value only); `.idxmax()` keeps *which row* won.

## 📌 Remember
- After multi-key `groupby().agg()` → **`.reset_index()`** to get a DataFrame back.
- "Which row is the max per group" = **`idxmax()` then `.loc[]`** (label-based pair).
- Symptom "my groupby chain doesn't work" → check: am I holding a MultiIndex Series?
