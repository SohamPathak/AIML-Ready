# Pandas — Per-group summary across two tables (merge/map + agg)
_Date: 2026-06-25 · DS coding · 7/10 · correct output, clever approach_

## Problem
Two tables (users, events; some users have NO events). Per-plan: n_users, total_watch_secs (0 if none), avg_watch_per_user.
Trap: users with no events must still count and contribute 0.

## My approach (clever — map + fillna, avoids join)
```python
total = events.groupby('user_id')['watch_secs'].sum().to_dict()
users['total_watch'] = users['user_id'].map(total).fillna(0)   # missing → 0
```
✅ Correct, elegant for "attach per-key aggregate to a base table." But doesn't generalize when you need row-level event detail → then use merge.

## Cleaner finish — NAMED AGGREGATION (make this the default)
```python
result = (users.groupby('plan')
    .agg(n_users=('user_id','count'),
         total_watch_secs=('total_watch','sum'),
         avg_watch_per_user=('total_watch','mean'))
    .reset_index())
```
→ flat, named columns. Beats the dict style `.agg({'col':['sum','mean']})` which makes a messy MultiIndex header.

## The merge equivalent (know this too — interviewer follow-up)
```python
df = users.merge(events, on='user_id', how='left')   # left keeps users w/ no events
df['watch_secs'] = df['watch_secs'].fillna(0)
result = (df.groupby('plan')
    .agg(n_users=('user_id','nunique'),
         total_watch_secs=('watch_secs','sum'))
    .assign(avg_watch_per_user=lambda d: d.total_watch_secs/d.n_users)
    .reset_index())
```
Note: with merge, n_users needs **nunique** (rows are duplicated per event), not count.

## 📌 Remember
1. **Named aggregation:** `.agg(new=('col','func'))` → clean flat columns. Default to it.
2. "Keep rows with no match" = **LEFT join** (merge how='left'); fill NaN → 0.
3. After merge that fans out rows, count distinct users with **nunique**, not count.
4. map+fillna is great for attaching an aggregate back to a base table.
