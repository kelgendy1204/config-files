---
description: Generate and execute a terse commit message from staged changes, then push
agent: build
---

1. Run `git diff --staged` to read the current staged changes.
2. If nothing is staged, tell the user and stop.
3. Do NOT stage or commit any unstaged changes. Only consider what's staged.
4. Do NOT modify any code.
5. Generate a commit message following these rules:
   - Conventional Commits format (e.g. `feat:`, `fix:`, `refactor:`, `docs:`)
   - Subject line: short, imperative mood, lowercase after type prefix
   - No period at end of subject
   - Body: include ONLY when the "why" isn't obvious from the subject
   - Body explains WHY, not what
   - Keep it terse
6. Proceed and run `git commit -m "<message>"` directly. Do NOT ask for confirmation.
7. If the commit fails, tell the user and stop. Do NOT attempt to fix it or ask for instructions.
8. Push the commit immediately after committing. Do NOT ask for confirmation.
9. Do NOT do anything else. Do NOT ask about anything else. Just push and stop.
