# Flashcards — Pandas (merge & agg)

Q: How do you produce clean, flat, named columns from a groupby?
A: Named aggregation: df.groupby('g').agg(new=('col','func'), ...). Avoids the messy MultiIndex from .agg({'col':['sum','mean']}).

Q: Which pandas merge keeps rows that have no match in the other table?
A: how='left' (keeps all left rows). Unmatched columns become NaN — fillna(0) as needed.

Q: After a left-merge that fans out rows (one user, many events), how do you count distinct users?
A: nunique, not count — count would count duplicated rows.

Q: How do you attach a per-key aggregate back onto a base table without a join?
A: Build a dict/Series of key→aggregate (groupby().sum()), then base['x'] = base['key'].map(agg).fillna(0).

Q: After groupby().agg(), how do you get the group key back as a column?
A: .reset_index() — flattens the group key out of the index.
