#!/usr/bin/env bash

browser_cmd=$(xdg-settings get default-web-browser | sed 's/\.desktop$//; s/-browser$//')

executable=$(command -v "$browser_cmd")

if [[ -n "$executable" ]]; then
    exec setsid uwsm-app -- "$executable" "$@"
else
    exec setsid uwsm-app -- "$browser_cmd" "$@"
fi
