# Two-Tower Retrieval — the depth that wins interviews
_From 2026-06-22 diagnostic (8/10). Serving was strong; training depth was the gap._

## Architecture
- **User tower:** user/context features → MLP → user embedding (n-dim).
- **Item tower:** item metadata features → MLP → item embedding (n-dim).
- **Score = dot product (or cosine) of the two embeddings.** Towers are INDEPENDENT until this final dot product.
- ⭐ **Why this matters:** independence is exactly *why* item embeddings can be precomputed offline and ANN-searched — they don't depend on the user. Always state this as the reason for the serving design.

## Training — negative sampling is the whole game
- Retrieval has **only positive signals** (watched/clicked). 99.99% of catalog is unobserved, not "negative."
- **In-batch negatives:** other users' positives in the same batch act as negatives (cheap).
- **Loss:** sampled softmax / contrastive (InfoNCE) — push positive score above sampled negatives. NOT plain BCE on watched/not.
- **logQ correction:** popular items appear as in-batch negatives too often → subtract log(sampling prob) so they aren't over-penalized.
- Can add hard negatives (similar-but-not-clicked) to sharpen.

## Serving (was already strong)
1. Precompute item embeddings → ANN index (FAISS in-mem if small/static; OpenSearch/external vector DB if large/changing).
2. Request time: user tower → user embedding (live).
3. **Top-k ANN search** (not threshold) → candidates → pass to ranking stage.

## 📌 Remember
1. Independent towers + final **dot product** → enables precompute. Say this.
2. **Negative sampling**: in-batch negatives + sampled softmax + **logQ correction**. Only positives are observed.
3. Serve = top-**k** ANN.
