# cc-loadout

Skill bundle for Claude Code agents.

## Install

```bash
/plugin marketplace add samcrock/cc-loadout
/plugin install cc-loadout@cc-loadout
```

## Skills by Category

### General

| Skill | Description |
|-------|-------------|
| caveman | Ultra-compressed comms — 75% token reduction |
| grill-me | Plan stress-testing via relentless questioning |

### Knowledge & Docs

| Skill | Description |
|-------|-------------|
| context7 | Up-to-date code documentation via ctx7 |
| graphify | Any input to knowledge graph with community detection |
| gitnexus | Zero-server code intelligence + Graph RAG agent |

### DevTools

| Tool | Description |
|------|-------------|
| gitnexus | Browser-based knowledge graph from GitHub repos |

### Frontend & Design

| Skill | Description |
|-------|-------------|
| huashu-design | HTML hi-fi prototypes, slides, animations |
| impeccable | Design vocabulary & anti-patterns |
| taste-skill | Anti-slop frontend framework |
| gsap-core | GSAP animation library |

### Generative AI / Media

| Skill | Description |
|-------|-------------|
| higgsfield-generate | Image/video generation, 30+ models |
| higgsfield-soul-id | Face-faithful Soul Character training |
| higgsfield-product-photoshoot | Brand-quality product imagery |
| higgsfield-marketplace-cards | Marketplace product cards |

## Setup

### HiggsField CLI (generative skills)

```bash
curl -fsSL https://raw.githubusercontent.com/higgsfield-ai/cli/main/install.sh | sh
higgsfield auth login
```

### Per-skill setup

- **graphify**: runs `graphify hook install` on postinstall
- **context7**: runs `npx ctx7 setup --claude` on postinstall (requires API key)