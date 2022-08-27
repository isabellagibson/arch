#!/usr/bin/env bash

killall -q polybar

for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload example &
done

echo "---" | tee -a /tmp/polybar1.log
polybar polybar1 >> /tmp/polybar1.log 2>&1 &
echo "Bars launched"