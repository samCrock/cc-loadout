---
name: gitnexus
description: Zero-server code intelligence engine — knowledge graph creator + Graph RAG agent for codebase exploration and skill generation
---

# GitNexus

Browser-based code intelligence tool. Runs entirely client-side.

## Install

```bash
npm install -g gitnexus
# Faster install (no C++ toolchain):
GITNEXUS_SKIP_OPTIONAL_GRAMMARS=1 npm install -g gitnexus
```

## Core Use

### 1. Analyze a GitHub repo

In browser: drop a GitHub repo URL or upload ZIP → interactive knowledge graph builds automatically.

### 2. Generate SKILL.md per codebase area

```bash
gitnexus analyze --skills
```

Generates `.claude/skills/generated/SKILL.md` per functional area via Leiden community detection. Each skill describes:
- Module's key files
- Entry points
- Execution flows
- Cross-area connections

Skills regenerate on each run — stay current with codebase.

### 3. Chat with the Graph RAG Agent

Built-in agent answers questions about the codebase using the knowledge graph.

### 4. Generate wiki/documentation

```bash
gitnexus wiki
```

Reads graph structure, groups files into modules via LLM, generates per-module docs with cross-references.

## Workflow

1. Drop repo → graph builds
2. Explore visually or chat with RAG agent
3. Run `gitnexus analyze --skills` to auto-generate targeted skills for your agent
4. Use generated skills in Claude Code for codebase-aware context

## When to Use

- Exploring unfamiliar codebase quickly
- Generating targeted context for specific modules
- Creating documentation from code structure
- Graph RAG queries against codebases

## See Also

- devtools/gitnexus — CLI alternative reference