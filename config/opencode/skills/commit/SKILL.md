---
name: commit
description: >
  Generate and execute a terse git commit from staged changes using Conventional Commits format.
  Use when user says "commit", "make a commit", or invokes /commit.
---

## Steps

1. Run `git diff --staged` to read the current staged changes.
2. If nothing is staged, tell the user and stop.
3. Generate a commit message following these rules:
   - Conventional Commits format (e.g. `feat:`, `fix:`, `refactor:`, `docs:`)
   - Subject line: short, imperative mood, lowercase after type prefix
   - No period at end of subject
   - Body: include ONLY when the "why" isn't obvious from the subject
   - Body explains WHY, not what
   - Keep it terse
4. Proceed and run `git commit -m "<message>"` directly. Do NOT ask for confirmation.
