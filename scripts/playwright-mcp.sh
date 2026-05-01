#!/usr/bin/env bash
# Wrapper to run @playwright/mcp with the system Chrome on NixOS.
# On NixOS, Playwright's bundled Chromium doesn't work due to non-FHS filesystem.
# Resolves the actual Chrome binary from the NixOS wrapper script at runtime.
if [ -f /run/current-system/sw/bin/google-chrome-stable ]; then
    CHROME_BIN=$(grep -oP '(?<=exec ")[^"]+' /run/current-system/sw/bin/google-chrome-stable | head -1)
    exec npx -y @playwright/mcp@latest --executable-path "$CHROME_BIN" "$@"
else
    exec npx -y @playwright/mcp@latest "$@"
fi
