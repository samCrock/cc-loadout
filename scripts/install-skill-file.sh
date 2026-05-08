#!/bin/bash
# Usage: ./install-skill-file.sh <skill-name> <source-file>
SKILL_NAME="$1"
SOURCE_FILE="$2"
DEST_DIR="$HOME/.claude/skills/$SKILL_NAME"
DEST_FILE="$DEST_DIR/SKILL.md"

if [ -f "$SOURCE_FILE" ]; then
  mkdir -p "$DEST_DIR"
  cp "$SOURCE_FILE" "$DEST_FILE"
  echo "Installed $SKILL_NAME to $DEST_FILE"
else
  echo "Warning: $SOURCE_FILE not found, skipping $SKILL_NAME"
fi