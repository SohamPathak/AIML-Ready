# Flashcards — Pandas

Q: After a multi-key groupby().sum(), why does the next groupby/.loc often "not work"?
A: The result is a Series with a MultiIndex, not a DataFrame. Call .reset_index() to flatten it to columns first.

Q: How do you get the row with the max value per group (keeping which row won)?
A: groupby(group)[value].idxmax() to get the winning index labels, then .loc[those_labels]. (.max() loses the label.)

Q: idxmax pairs with .loc or .iloc — which and why?
A: .loc — idxmax returns index LABELS, and loc selects by label. iloc is positional and breaks on non-range indexes.

Q: Full "max entity per group" pandas pattern?
A: df.groupby([group, entity])[value].sum().reset_index(), then .loc[that.groupby(group)[value].idxmax()].
