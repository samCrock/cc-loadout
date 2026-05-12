# cc-loadout

Skill suite for Claude Code agents — frontend design, generative AI, knowledge graphs, and compressed communication.

## Install

```bash
apm install samcrock/cc-loadout
```

This reads `apm.yml` from the repo root, resolves all skill collections and agents, and installs them to your Claude Code skills directory.

## Skills

| Category | Skills |
|----------|--------|
| **Frontend** | gsap-core, huashu-design, impeccable, taste-skill |
| **General** | caveman, grill-me |
| **Generative** | higgsfield-generate, higgsfield-marketplace-cards, higgsfield-product-photoshoot, higgsfield-soul-id |
| **Knowledge** | context7, gitnexus, graphify |

## MCP Servers

| Server | Purpose |
|--------|---------|
| context-mode | Persistent context with BM25 search |
| browser | Browser automation via CDP |
| github-mcp-server | GitHub API integration |

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