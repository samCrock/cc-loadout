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

## Skills needing extra setup

- **graphify**: runs `graphify hook install` on postinstall
- **context7**: runs `npx ctx7 setup --claude` on postinstall (requires API key)
