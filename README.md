# cc-loadout

Skill suite for Claude Code — frontend design, generative AI, knowledge graphs, compressed comms.

## Install (project-level)

**1. Install APM:**

```bash
# macOS / Linux
curl -sSL https://aka.ms/apm-unix | sh

# Windows (PowerShell)
irm https://aka.ms/apm-windows | iex
```

Verify:
```bash
apm --version
```

**2. Initialize and install:**

```bash
git clone samcrock/cc-loadout my-project
cd my-project
apm init
apm install samcrock/cc-loadout
```

Or from an existing repo:

```bash
apm install samcrock/cc-loadout
```

APM installs into the **current project directory**:
- `apm_modules/` — downloaded dependencies (gitignored)
- `.agents/skills/` — integrated skills (harness-neutral)

Skills are project-scoped, not user-global. Run `apm install` in each project that needs these skills.

See the [APM quickstart](https://microsoft.github.io/apm/quickstart/) for full documentation.

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

See [microsoft.github.io/apm](https://microsoft.github.io/apm) for APM CLI docs.