---
name: skill-adder
description: >
  Add a new skill to cc-loadout. Given a reference skill path or name,
  clones/copies it into the suite with correct structure (.apm/skills/),
  registers it in apm.yml, marketplace.json, and README.md.
  Use when user says "add skill", "add this to the suite", "new skill".
---

## Usage

`skill-adder <source-skill-path> [target-name]`

Where:
- `<source-skill-path>` — GitHub path like `owner/repo/.apm/skills/category/name`
- `[target-name]` — optional override for skill name (defaults to last path segment)

## Process

1. **Parse inputs** — extract owner, repo, category, name from source path
2. **Create directory** — `.apm/skills/{category}/{name}/`
3. **Fetch SKILL.md** — from `https://raw.githubusercontent.com/{owner}/{repo}/main/.apm/skills/{category}/{name}/SKILL.md`
4. **Write files** — save SKILL.md to new directory
5. **Update apm.yml** — add `github.com/{owner}/{repo}/.apm/skills/{category}/{name}` to dependencies.apm
6. **Update marketplace.json** — add plugin entry with description from SKILL.md frontmatter
7. **Update README.md** — add skill to appropriate category table

## apm.yml format

```yaml
dependencies:
  apm:
    - github.com/{owner}/{repo}/.apm/skills/{category}/{name}
```

## marketplace.json format

```json
{
  "name": "{name}",
  "description": "{description from SKILL.md}",
  "source": "./.apm/skills/{category}/{name}",
  "strict": false
}
```

## README.md format

Add row to category table:

```
| {name} | {description} |
```

## Validation

- SKILL.md must exist at source path
- description field required in frontmatter
- category must be: frontend, general, generative, or knowledge
- name must be unique across suite

## Example

Input: `anthropics/skills/skills/frontend-design`

- owner: `anthropics`
- repo: `skills`
- category: `frontend`
- name: `design`

Creates:
- `.apm/skills/frontend/design/SKILL.md`
- Adds to apm.yml
- Adds to marketplace.json
- Adds to README.md