# cc-loadout

Skill suite for Claude Code — frontend design, generative AI, knowledge graphs, compressed comms.

## Install (project-level)

```bash
git clone samcrock/cc-loadout my-project
cd my-project
apm install
```

Or from an existing repo:

```bash
apm install samcrock/cc-loadout
```

APM installs into the **current project directory**:
- `apm_modules/` — downloaded dependencies (gitignored)
- `.claude/` — compiled Claude Code output (generated)

Skills are project-scoped, not user-global. Run `apm install` in each project that needs these skills.

## Skills

| Category | Skills |
|----------|--------|
| **Frontend** | gsap-core, huashu-design, impeccable, taste-skill |
| **Generative** | higgsfield-generate, marketplace-cards, product-photoshoot, soul-id |
| **Knowledge** | context7, gitnexus, graphify |
| **Productivity** | caveman (compressed comms), grill-me (plan stress-testing), handoff, skill-adder |

## Setup

### HiggsField CLI (generative skills)

```bash
curl -fsSL https://raw.githubusercontent.com/higgsfield-ai/cli/main/install.sh | sh
higgsfield auth login
```

### context7 (library docs)

```bash
npx ctx7 setup --claude --cli
```

See [microsoft/apm](https://github.com/microsoft/apm) for APM CLI docs.