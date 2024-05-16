#!/usr/bin/env bash
CWD="$(pwd)"
GYM_PATH="$(readlink -f "$0")"
GYM_DIR="$(dirname "$GYM_PATH")"
REPO_DIR="$(dirname "$GYM_DIR")"
LIFTS_PATH="$GYM_DIR/lifts.txt"
PHRASES_PATH="$GYM_DIR/phrases.txt"

if [[ -f "$PHRASES_PATH" ]]; then
    NUM_LINES=$(wc -l < "$PHRASES_PATH")
    RANDOM_LINE_NUM=$((RANDOM % NUM_LINES + 1))
    PHRASE=$(awk "NR==$RANDOM_LINE_NUM" "$PHRASES_PATH")
else
    echo "File $PHRASES_PATH does not exist."
fi

read -r NUM_LIFTS < "$LIFTS_PATH"
echo "Current number of repetitions: "$NUM_LIFTS""
echo $((NUM_LIFTS + 1)) > "$LIFTS_PATH"
read -r NUM_LIFTS < "$LIFTS_PATH"
echo "Current number of repetitions: $NUM_LIFTS"

cd "$REPO_DIR"
git pull origin main
git add gym/lifts.txt
git commit -m "refactor: $PHRASE"
git push origin main
cd "$CWD"
