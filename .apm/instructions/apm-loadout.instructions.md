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
1. Read `docs/repos.md` to get the list of skill repositories and their **exact categories**
2. Use the `apm-converter` skill to convert each repository with the **correct category** from repos.md
3. Deploy converted skills to `.claude/skills/`
4. Report success/failure for each skill

## Critical: Use Exact Categories from repos.md

Each skill in `docs/repos.md` has a specific category. **Use the category as-is** — do not infer or change it.

For reference, conversion commands will use these categories:
```bash
apm-converter greensock/gsap-skills/gsap-core --category frontend
apm-converter alchaincyf/huashu-design --category frontend
apm-converter upstash/context7 --category productivity
apm-converter pbakaus/impeccable --category productivity
apm-converter leonxlnx/taste-skill --category productivity
apm-converter abhigyanpatwari/GitNexus --category productivity
apm-converter safishamsi/graphify --category productivity
apm-converter juliusbrussee/caveman --category productivity
apm-converter mattpocock/skills/productivity/grill-me --category productivity
apm-converter mattpocock/skills/productivity/handoff --category productivity
```

## Deployment

After conversion, **always deploy skills** to make them discoverable:
```bash
mkdir -p .claude/skills
cp -r .apm/skills/* .claude/skills/
```

## Available Commands

- `apm compile --target claude` - Compile instructions into CLAUDE.md
- `apm outdated` - Check for upstream skill updates
- `apm deps update` - Update skills to latest upstream versions

## Skill Catalog

See `docs/repos.md` for the list of all available skills that can be installed.