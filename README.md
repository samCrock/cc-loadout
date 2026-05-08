# cc-loadout

Skill bundle for Claude Code agents.

## Install

```bash
/plugin marketplace add samcrock/cc-loadout
/plugin install cc-loadout@cc-loadout
```

## Skills

| Skill | Description |
|-------|-------------|
| graphify | Knowledge graph from any input |
| impeccable | Frontend design principles |
| context7 | Up-to-date code docs |
| caveman | Ultra-compressed comms |
| grill-me | Plan stress-testing |
| huashu-design | Design generation |
| gsap-core | GSAP animations |
| taste-skill | Anti-slop frontend |
| higgsfield-generate | Image/video generation, 30+ models |
| higgsfield-soul-id | Face-faithful Soul Character training |
| higgsfield-product-photoshoot | Brand-quality product imagery |
| higgsfield-marketplace-cards | Marketplace product cards |

## HiggsField Setup

```bash
curl -fsSL https://raw.githubusercontent.com/higgsfield-ai/cli/main/install.sh | sh
higgsfield auth login
```

## Skills needing extra setup

- **graphify**: runs `graphify hook install` on postinstall
- **context7**: runs `npx ctx7 setup --claude` on postinstall (requires API key)
- **higgsfield-\***: requires HiggsField CLI + auth
