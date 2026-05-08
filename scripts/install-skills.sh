#!/bin/bash
set -e

SKILLS_DIR="$(cd "$(dirname "$0")/../skills" && pwd)"

install_skill() {
  local name="$1"
  local src="$SKILLS_DIR/$2"
  bash "$(dirname "$0")/install-skill-file.sh" "$name" "$src"
}

echo "Installing cc-loadout skills..."

# Core skills — SKILL.md copy only
install_skill "caveman" "caveman/SKILL.md"
install_skill "grill-me" "grill-me/SKILL.md"
install_skill "impeccable" "impeccable/SKILL.md"
install_skill "huashu-design" "huashu-design/SKILL.md"
install_skill "gsap-core" "gsap-core/SKILL.md"
install_skill "taste-skill" "taste-skill/SKILL.md"

# graphify — needs: graphify hook install
install_skill "graphify" "graphify/SKILL.md"
if command -v graphify &> /dev/null; then
  graphify hook install 2>/dev/null || echo "graphify hook install skipped"
fi

# context7 — needs: ctx7 setup (skill-mode install)
install_skill "context7" "context7/SKILL.md"
npx -y ctx7 setup --claude --cli --yes 2>/dev/null || echo "ctx7 setup skipped (run manually if needed)"

echo "cc-loadout installation complete."
