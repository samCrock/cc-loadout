---
name: apm-converter
description: >
  Convert non-APM skills to APM-compatible packages. Takes a skill from any source
  (git URL, local path, npm package, or raw files) and transforms it into a valid APM
  package with proper .apm/skills/{category}/{name}/ structure, apm.yml, and hooks.
  Use when user says "convert skill", "make apm compatible", "import non-apm skill".
---

## Usage

```
apm-converter <source> [options]
```

**Source types:**
- Git URL: `https://gitlab.com/team/skill.git` or `git:https://...`
- GitHub shorthand: `owner/repo/path/to/skill`
- Local path: `./path/to/skill` or `/absolute/path`
- NPM package: `npm:some-skill-package`
- Raw files: pass directory structure directly

**Options:**
- `--category <name>` — Override target category (default: infer from skill type)
- `--name <name>` — Override target skill name
- `--force` — Overwrite existing skill if present
- `--dry-run` — Preview conversion without writing files

## Conversion Process

### Step 1: Analyze Source Skill

Inspect the source to determine:
- Skill format (SKILL.md presence, directory structure)
- Dependencies (npm packages, pip modules, MCP servers)
- Installation scripts (setup.sh, install.js, requirements.txt)
- Resource files (templates, references, scripts)

### Step 2: Create APM Package Structure

```
converted-skill/
├── apm.yml                    ← Generated manifest
└── .apm/
    ├── skills/
    │   └── {category}/
    │       └── {name}/
    │           ├── SKILL.md   ← Converted entry point
    │           └── references/ ← Bundled resources
    ├── hooks/                 ← Installation hooks (if needed)
    └── scripts/               ← Setup scripts (if needed)
```

### Step 3: Generate apm.yml

```yaml
name: {converted-name}
version: 1.0.0
description: {derived from skill description}
type: skill
target:
  - claude
  - copilot
  - cursor
includes:
  - skills/{category}/{name}
upstream:
  source: {original-source-url}
  ref: {resolved-ref}
dependencies:
  apm: []
  mcp: []
```

**Important:** Store the original source URL and resolved ref in `upstream:` block. This enables:
- `apm outdated` to check for upstream updates
- `apm deps update` to fetch latest upstream versions
- Clear provenance tracking for converted skills

When converting from GitHub shorthand (e.g., `owner/repo/path`), resolve to full URL and current commit hash as `ref`.

### Step 4: Convert SKILL.md

Transform to agent-skills standard format:
- Add/update frontmatter with `name:` and `description:` (≤1024 chars)
- `description` must: start with "Use when...", intent-first, no slash-commands
- Move long-form content to `references/` subdirectory
- Preserve all original guidance and steps

### Step 5: Handle Installation Scripts

If source has install/setup scripts:

**Option A: Hooks (preferred for APM-native)**
```json
// .apm/hooks/pre-install-setup.json
{
  "hooks": {
    "PreToolUse": [{
      "hooks": [{
        "type": "command",
        "command": "${PLUGIN_ROOT}/scripts/setup.sh",
        "timeout": 30
      }]
    }]
  }
}
```

**Option B: Commands (for user-initiated setup)**
Add to SKILL.md:
```markdown
## Installation

Run setup after installing:
```bash
./scripts/setup.sh
```

## Commands

Add to apm.yml:
```yaml
scripts:
  setup: "./scripts/setup.sh"
```

### Step 6: Handle Dependencies

**NPM/Pip packages:** Document in SKILL.md installation section
**MCP servers:** Add to apm.yml mcp section
```yaml
dependencies:
  mcp:
    - name: filesystem
      registry: false
      transport: stdio
      command: npx
      args: ["-y", "@modelcontextprotocol/server-filesystem", "/workspace"]
```

### Step 7: Validate & Register

```bash
apm compile                        # Check per-target output
apm audit --file .apm/skills/{category}/{name}/SKILL.md
apm install ./converted-skill       # Install locally
```

## Source Type Handlers

### Git URL
```
1. git clone <url> /tmp/<name>
2. Analyze /tmp/<name> structure
3. Apply conversion steps
4. Clean up /tmp/<name>
```

### GitHub Shorthand
```
1. Fetch https://raw.githubusercontent.com/{owner}/{repo}/{ref}/path/SKILL.md
2. Fetch supporting files
3. Apply conversion steps
```

### NPM Package
```
1. npm pack <package> to /tmp
2. Extract and analyze
3. Apply conversion steps
```

### Local Path
```
1. Analyze local directory structure
2. Apply conversion steps
3. Copy to .apm/skills/{category}/{name}/
```

## Category Detection

Infer category from skill content:
- `frontend`, `ui`, `css`, `design`, `web` → `frontend`
- `generate`, `image`, `video`, `creative`, `art` → `generative`
- `git`, `github`, `version`, `code review` → `knowledge`
- `productivity`, `writing`, `communication`, `efficiency` → `productivity`
- `debug`, `test`, `quality`, `security` → `productivity`
- Default → `productivity`

## Example

Input: `https://github.com/someuser/custom-skill`

```
1. Clone to /tmp/custom-skill
2. Find: SKILL.md, setup.sh, templates/, references/
3. Fetch current commit hash: abc123def
4. Generate apm.yml with:
   - name: custom-skill
   - upstream:
     source: https://github.com/someuser/custom-skill
     ref: abc123def
   - version: 1.0.0
5. Convert SKILL.md to agent-skills format
6. Copy setup.sh to .apm/scripts/setup.sh
7. Create .apm/hooks/pre-install-setup.json
8. Validate with apm compile
9. Report: "Converted to .apm/skills/productivity/custom-skill/"
   └── Run: apm install to deploy
   └── Run: apm outdated to check for upstream updates
   └── Run: apm deps update to fetch latest upstream
```

## Error Handling

| Error | Response |
|-------|----------|
| No SKILL.md found | Error: "Source does not contain SKILL.md. Is it a valid skill?" |
| Invalid frontmatter | Attempt to recover; if fails, error with field missing |
| Name collision | Prompt: "--force to overwrite, or --name to rename" |
| Fetch failed | Error: "Cannot reach source: {url}. Check connectivity." |
| Install fails | Report: "Conversion successful but APM install failed: {error}" |
| Cannot resolve upstream ref | Error: "Cannot determine current commit hash for {source}. Is it a valid git repository?" |

## Version Tracking

Converted skills use the `upstream:` block to enable APM's standard version tracking:

```yaml
upstream:
  source: https://github.com/owner/skill-repo
  ref: abc123def  # commit hash, not tag
```

**Supported operations:**
- `apm outdated` — checks if upstream has new versions
- `apm deps update` — fetches latest from upstream within version constraints
- `apm deps update <package>` — update specific converted skill

**Version resolution:**
- For GitHub shorthand `owner/repo#v1.0.0`: resolves to tag commit
- For bare `owner/repo`: uses latest commit on default branch
- Store resolved commit hash in `ref` for exact pinning

## Output

On success:
```
✓ Converted: {source} → .apm/skills/{category}/{name}/
✓ apm.yml updated with upstream block
✓ Run: apm install to deploy
✓ Run: apm outdated to check for upstream updates
```

On failure:
```
✗ Conversion failed: {reason}
  Hint: {suggestion}
```

**Post-conversion workflow:**
```bash
# 1. Install converted skill
apm install

# 2. Check for upstream updates (when available)
apm outdated

# 3. Update to latest upstream version
apm deps update

# 4. Commit converted skill
git add .apm/skills/{category}/{name}/
git commit -m "convert: {skill-name} from {upstream-source}"
```