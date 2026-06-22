# Auto-commit protocol

At the end of every session that changes files, Claude commits and pushes automatically.

## Steps
1. `git add -A`
2. Commit with a descriptive message:
   ```
   git commit -m "<pillar>: <what was practiced> — <date>"
   ```
   Examples:
   - `dsa: two-pointers medium solved (8/10) — 2026-06-22`
   - `theory: xgboost deep-dive + 3 flashcards — 2026-06-23`
   - `mock: recsys system design round + debrief — 2026-06-29`
3. `git push` (remote `origin` = git@github.com:SohamPathak/AIML-Ready.git, SSH, already authenticated).
4. If push fails, report it — don't silently swallow.

> Keeps GitHub as the always-current backup + a visible record of daily progress.
