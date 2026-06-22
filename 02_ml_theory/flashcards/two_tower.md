# Flashcards — Two-Tower Retrieval

Q: In a two-tower model, how are the user and item towers combined?
A: They stay independent; the score is the dot product (or cosine) of the two embeddings at the very end.

Q: Why can you precompute item embeddings for serving?
A: Because item embeddings don't depend on the user — the towers only interact at the final dot product. So you compute them offline and ANN-search.

Q: In two-tower retrieval, where do negative examples come from?
A: You only observe positives. Use in-batch negatives (other users' positives in the batch) — not a "not watched" label.

Q: What loss is typically used to train two-tower retrieval?
A: Sampled softmax / contrastive (InfoNCE) — push the positive's score above sampled negatives. Not plain BCE.

Q: What is the logQ correction in two-tower training?
A: Subtract log(sampling probability) to stop popular items from being over-penalized when they appear frequently as in-batch negatives.

Q: At serve time, how do you retrieve candidates from a two-tower model?
A: Embed the user live, then top-k ANN search over the precomputed item index. Top-k, not a similarity threshold.
