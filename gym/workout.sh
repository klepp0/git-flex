#!/usr/bin/env bash
CWD="$(pwd)"
GYM_PATH="$(readlink -f "$0")"
GYM_DIR="$(dirname "$GYM_PATH")"
REPO_DIR="$(dirname "$GYM_DIR")"
LIFTS_PATH="$GYM_DIR/lifts.txt"

read -r NUM_LIFTS < "$LIFTS_PATH"

echo "Current number of repetitions: "$NUM_LIFTS""
echo "🏋️ Let's lift it"

echo $((NUM_LIFTS + 1)) > "$LIFTS_PATH"
read -r NUM_LIFTS < "$LIFTS_PATH"

echo "Current number of repetitions: $NUM_LIFTS"

cd "$REPO_DIR"
git add gym/lifts.txt
git commit -m "refactor: 🏋️ let's lift it"
git push origin main
cd "$CWD"
