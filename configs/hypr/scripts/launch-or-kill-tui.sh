#!/usr/bin/env bash

if [[ -z "$1" ]]; then
    echo "Usage: launch-or-kill-tui <command> [args...]"
    exit 1
fi

APP_NAME="org.arch.$(basename "$1")"
WINDOW_PATTERN=$(echo "$APP_NAME" | tr '[:upper:]' '[:lower:]')

WINDOW_ADDRESS=$(hyprctl clients -j | jq -r --arg p "$WINDOW_PATTERN" '
    .[] | select(
        (.class | ascii_downcase | contains($p)) or 
        (.title | ascii_downcase | contains($p))
    ) | .address' | head -n1)

if [[ -n "$WINDOW_ADDRESS" && "$WINDOW_ADDRESS" != "null" ]]; then
    hyprctl dispatch "hl.dsp.window.close({ window = \"address:$WINDOW_ADDRESS\" })" >/dev/null 2>&1 || hyprctl dispatch closewindow "address:$WINDOW_ADDRESS"
else
    exec setsid uwsm-app -- xdg-terminal-exec --app-id="$APP_NAME" --title="$APP_NAME" -e "$@"
fi
