# Tool: `flashcards`

Rapid spaced-repetition recall. Quick daily reps; revision-friendly.

## Behavior
1. Read `08_tracker/review_queue.md` → pull items due today (and any overdue). Also pull from `02_ml_theory/flashcards/`.
2. If nothing due, generate fresh cards from the weakest topics in the profile.
3. Ask ~10 cards, one at a time. Short answers expected. **Front first, Soham recalls, then reveal back.**
4. Soham self-rates each: again / hard / good / easy → you update the interval:
   - again → interval resets to 1d, miss++.
   - hard → interval ×1.2.
   - good → interval ×2 (1→3→7→16→35).
   - easy → interval ×3.
5. Update `review_queue.md` due dates. Log a summary row in progress_log.
6. New high-value facts learned in other sessions get auto-added as cards.

## Card source files
Store reusable cards in `02_ml_theory/flashcards/<topic>.md` as:
```
Q: ...
A: ...
```
One concept per card. Keep them atomic (one fact each).
