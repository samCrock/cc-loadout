# apm-loadout

Claude Code skill installation and conversion toolkit.

## Purpose

This repo serves two roles:

1. **APM package** — Install to get the `apm-converter` skill
2. **Skill catalog** — `docs/repos.md` lists available skills for conversion

## Install

```bash
# Install APM
curl -sSL https://aka.ms/apm-unix | sh  # macOS/Linux
irm https://aka.ms/apm-windows | iex      # Windows

# Install this package
apm install samcrock/apm-loadout
```

## What's Included

| Path | Purpose |
|------|---------|
| `.apm/skills/productivity/apm-converter/` | Bridge skill — converts non-APM skills to APM format |
| `.apm/instructions/apm-loadout.instructions.md` | Instructions compiled into CLAUDE.md |
| `docs/repos.md` | Catalog of available skills (GitHub repos) |

## Workflow

1. **Install** → `apm install samcrock/apm-loadout`
2. **Compile** → `apm compile --target claude` — merges instructions into CLAUDE.md
3. **Install all** → Tell Claude Code: "Install all skills from docs/repos.md"
4. **Update** → `apm outdated` / `apm deps update` to track upstream

## Converting a Skill

```bash
# Convert a skill from GitHub
apm-converter owner/repo/skill --category frontend

# Check for upstream updates
apm outdated

# Update to latest upstream version
apm deps update
```

## Skills Catalog

See [docs/repos.md](docs/repos.md) for the list of available skills.

## Documentation

- [APM quickstart](https://microsoft.github.io/apm/quickstart/)
- [APM CLI reference](https://github.com/microsoft/apm)