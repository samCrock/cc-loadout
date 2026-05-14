---
name: apm-loadout-instructions
description: >
  Instructions for installing all skills from the apm-loadout package.
  This file is compiled into CLAUDE.md by `apm compile --target claude`.
applyTo: claude
---

# APM Loadout - Skill Installation

After installing `apm-loadout`, run `apm compile --target claude` to generate your CLAUDE.md with these instructions.

## How to Install All Skills

When you want to install all skills from the loadout catalog, tell Claude Code:

> "Install all skills from docs/repos.md using apm-converter"

Claude Code will:
1. Read `docs/repos.md` to get the list of skill repositories
2. Use the `apm-converter` skill to convert each repository to APM format
3. Report success/failure for each skill

## Conversion Commands

For reference, Claude Code will run commands like:
```bash
apm-converter greensock/gsap-skills/gsap-core --category frontend
apm-converter alchaincyf/huashu-design --category frontend
apm-converter upstash/context7 --category productivity
# ... etc for all repos in docs/repos.md
```

## Available Commands

- `apm compile --target claude` - Compile instructions into CLAUDE.md
- `apm outdated` - Check for upstream skill updates
- `apm deps update` - Update skills to latest upstream versions

## Skill Catalog

See `docs/repos.md` for the list of all available skills that can be installed.