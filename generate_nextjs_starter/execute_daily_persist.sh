#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
LAST_RUN_FILE="$SCRIPT_DIR/.last_run_nextjs_update"

run_update() {
    cd "$SCRIPT_DIR"
    node generateWeeklyDefaultNextjsApp.js
    echo $(date +%s) > "$LAST_RUN_FILE"
}

if [ ! -f "$LAST_RUN_FILE" ]; then
    run_update
else
    last_run=$(cat "$LAST_RUN_FILE")
    current_time=$(date +%s)
    time_diff=$((current_time - last_run))
    
    if [ $time_diff -ge 86400 ]; then  # 86400 seconds = 1 day
        run_update
    fi
fi
