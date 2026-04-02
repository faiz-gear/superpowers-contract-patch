# Superpowers Contract Patch

Contract-first API workflow patches for `superpowers`.

This repository is a fork-oriented template for teams that want to keep the original `superpowers` skill-driven workflow while adding stronger contract discipline for long-running backend and frontend collaboration.

GitHub description suggestion: A fork of Superpowers with contract-first API workflow patches, OpenAPI gates, and compound knowledge recall.

## What This Fork Adds

This fork keeps the original `superpowers` backbone and adds four patch-layer capabilities:

- `recall-contract-context`
  Pull validated prior knowledge before implementation starts.
- `backend-contract-exit-gate`
  Block backend completion unless the published contract is usable.
- `frontend-contract-entry-gate`
  Block frontend API consumption until the latest contract is verified and client artifacts are regenerated.
- `compound-knowledge-summary`
  Turn successful delivery lessons into reusable knowledge instead of letting them disappear into session history.

## Why This Exists

Long-running agent workflows usually fail at the boundaries:

- backend code changes but `OpenAPI` is stale
- frontend starts from an old contract
- `operationId` is missing, breaking SDK generation
- `2xx` responses degrade into vague objects
- teams drift away from a shared envelope structure

This template makes those failure modes explicit and hard to ignore.

## Core Principle

`OpenAPI` is the single source of truth for interface delivery.

That single truth powers both sides of the handoff:

- backend has an exit gate
- frontend has an entry gate
- both gates validate against the same contract authority

The workflow does **not** hard-code implementation details into prompts. It constrains boundaries and verification, while leaving implementation inside the boundary to model capability.

## How The Workflow Changes

The base `superpowers` flow remains:

1. `brainstorming`
2. `writing-plans`
3. implementation
4. verification

This fork inserts contract-focused patches at the critical points:

1. `brainstorming`
2. `writing-plans`
3. `recall-contract-context`
4. implementation
5. `backend-contract-exit-gate`
6. publish or refresh `OpenAPI`
7. `frontend-contract-entry-gate`
8. integration
9. `compound-knowledge-summary`

## Contract Invariants

For API-facing work, these are hard requirements:

- every public endpoint has a stable `operationId`
- every `2xx` response resolves to a concrete business DTO
- every response follows the standard envelope
- frontend consumption starts from the latest `OpenAPI`, not stale memory
- validated lessons are written back into knowledge assets

If any invariant fails, the workflow is blocked.

## Repository Layout

This template separates process, knowledge, contract policy, and verification:

- `skills/`
  Patch-layer skills that extend the original `superpowers` flow.
- `workflows/`
  Cross-skill delivery flows such as API delivery and frontend API consumption.
- `knowledge/`
  Reusable patterns, examples, incidents, and compound summaries.
- `gates/`
  Hard acceptance criteria for backend exit and frontend entry.
- `contracts/`
  Source-of-truth policy and contract lifecycle rules.
- `templates/`
  Standardized intermediate artifacts such as recall notes and gate reports.

## Who This Is For

Use this template if you want:

- a `superpowers`-style workflow rather than a brand-new agent framework
- stronger backend and frontend coordination through `OpenAPI`
- explicit guardrails against contract drift
- a way to accumulate validated delivery knowledge over time

This template is a poor fit if:

- your work is not contract-heavy
- you want framework-specific code generators baked into the repository
- you want a completely new orchestration model instead of a patch layer

## Using This Template

Recommended path:

1. Fork this repository.
2. Decide where the authoritative `OpenAPI` artifact lives in your real product repos.
3. Adapt the gate docs to your stack-specific verification commands.
4. Extend the `knowledge/patterns` and `knowledge/incidents` folders with your actual team rules.
5. Teach your agents to invoke the patch skills for API-facing work.

This repository is intentionally a **pure specification template**. It defines workflow, gates, and knowledge shape first. Stack-specific scripts can be added later in your own fork.

## Relationship To Upstream Superpowers

This repository is based on [`superpowers`](https://github.com/obra/superpowers) and keeps its core philosophy:

- skills drive workflow
- planning comes before implementation
- verification comes before completion claims

The difference is that this fork is opinionated about API contract discipline, knowledge recall, and gated frontend/backend handoff.

## How Upstream Superpowers Works

It starts from the moment you fire up your coding agent. As soon as it sees that you're building something, it *doesn't* just jump into trying to write code. Instead, it steps back and asks you what you're really trying to do.

Once it's teased a spec out of the conversation, it shows it to you in chunks short enough to actually read and digest.

After you've signed off on the design, your agent puts together an implementation plan that's clear enough for an enthusiastic junior engineer with poor taste, no judgement, no project context, and an aversion to testing to follow. It emphasizes true red/green TDD, YAGNI (You Aren't Gonna Need It), and DRY.

Next up, once you say "go", it launches a *subagent-driven-development* process, having agents work through each engineering task, inspecting and reviewing their work, and continuing forward. It's not uncommon for Claude to be able to work autonomously for a couple hours at a time without deviating from the plan you put together.

There's a bunch more to it, but that's the core of the system. And because the skills trigger automatically, you don't need to do anything special. Your coding agent just has Superpowers.


## Sponsorship

If Superpowers has helped you do stuff that makes money and you are so inclined, I'd greatly appreciate it if you'd consider [sponsoring my opensource work](https://github.com/sponsors/obra).

Thanks! 

- Jesse


## Installation

**Note:** Installation differs by platform. Claude Code or Cursor have built-in plugin marketplaces. Codex and OpenCode require manual setup.

### Install via skills.sh

If you want to distribute this fork through the `skills.sh` ecosystem, the most portable install path is the `skills` CLI.

Install the whole repository as a skill collection:

```bash
npx skills add https://github.com/faiz-gear/superpowers-contract-patch
```

Install one specific patch skill from this repository:

```bash
npx skills add https://github.com/faiz-gear/superpowers-contract-patch --skill recall-contract-context
npx skills add https://github.com/faiz-gear/superpowers-contract-patch --skill backend-contract-exit-gate
npx skills add https://github.com/faiz-gear/superpowers-contract-patch --skill frontend-contract-entry-gate
npx skills add https://github.com/faiz-gear/superpowers-contract-patch --skill compound-knowledge-summary
```

If your `skills` CLI setup supports owner/repo shorthand, this may also work:

```bash
npx skills add faiz-gear/superpowers-contract-patch
```

After installation, restart your agent session so the new skills are picked up.

### Claude Code Official Marketplace

Superpowers is available via the [official Claude plugin marketplace](https://claude.com/plugins/superpowers)

Install the plugin from Claude marketplace:

```bash
/plugin install superpowers@claude-plugins-official
```

### Claude Code (via Plugin Marketplace)

In Claude Code, register the marketplace first:

```bash
/plugin marketplace add obra/superpowers-marketplace
```

Then install the plugin from this marketplace:

```bash
/plugin install superpowers@superpowers-marketplace
```

### Cursor (via Plugin Marketplace)

In Cursor Agent chat, install from marketplace:

```text
/add-plugin superpowers
```

or search for "superpowers" in the plugin marketplace.

### Codex

Tell Codex:

```
Fetch and follow instructions from https://raw.githubusercontent.com/obra/superpowers/refs/heads/main/.codex/INSTALL.md
```

**Detailed docs:** [docs/README.codex.md](docs/README.codex.md)

### OpenCode

Tell OpenCode:

```
Fetch and follow instructions from https://raw.githubusercontent.com/obra/superpowers/refs/heads/main/.opencode/INSTALL.md
```

**Detailed docs:** [docs/README.opencode.md](docs/README.opencode.md)

### GitHub Copilot CLI

```bash
copilot plugin marketplace add obra/superpowers-marketplace
copilot plugin install superpowers@superpowers-marketplace
```

### Gemini CLI

```bash
gemini extensions install https://github.com/obra/superpowers
```

To update:

```bash
gemini extensions update superpowers
```

### Verify Installation

Start a new session in your chosen platform and ask for something that should trigger a skill (for example, "help me plan this feature" or "let's debug this issue"). The agent should automatically invoke the relevant superpowers skill.

## The Basic Workflow

1. **brainstorming** - Activates before writing code. Refines rough ideas through questions, explores alternatives, presents design in sections for validation. Saves design document.

2. **using-git-worktrees** - Activates after design approval. Creates isolated workspace on new branch, runs project setup, verifies clean test baseline.

3. **writing-plans** - Activates with approved design. Breaks work into bite-sized tasks (2-5 minutes each). Every task has exact file paths, complete code, verification steps.

4. **subagent-driven-development** or **executing-plans** - Activates with plan. Dispatches fresh subagent per task with two-stage review (spec compliance, then code quality), or executes in batches with human checkpoints.

5. **test-driven-development** - Activates during implementation. Enforces RED-GREEN-REFACTOR: write failing test, watch it fail, write minimal code, watch it pass, commit. Deletes code written before tests.

6. **requesting-code-review** - Activates between tasks. Reviews against plan, reports issues by severity. Critical issues block progress.

7. **finishing-a-development-branch** - Activates when tasks complete. Verifies tests, presents options (merge/PR/keep/discard), cleans up worktree.

**The agent checks for relevant skills before any task.** Mandatory workflows, not suggestions.

## Patch Skills In This Fork

- **recall-contract-context** - Pulls prior DTO, envelope, OpenAPI, and incident knowledge before API work starts
- **backend-contract-exit-gate** - Prevents backend completion claims when contract invariants fail
- **frontend-contract-entry-gate** - Requires fresh `OpenAPI` comparison and client regeneration before frontend API work
- **compound-knowledge-summary** - Writes validated delivery lessons back into repository knowledge

## What's Inside

### Skills Library

**Testing**
- **test-driven-development** - RED-GREEN-REFACTOR cycle (includes testing anti-patterns reference)

**Debugging**
- **systematic-debugging** - 4-phase root cause process (includes root-cause-tracing, defense-in-depth, condition-based-waiting techniques)
- **verification-before-completion** - Ensure it's actually fixed

**Collaboration** 
- **brainstorming** - Socratic design refinement
- **writing-plans** - Detailed implementation plans
- **executing-plans** - Batch execution with checkpoints
- **dispatching-parallel-agents** - Concurrent subagent workflows
- **requesting-code-review** - Pre-review checklist
- **receiving-code-review** - Responding to feedback
- **using-git-worktrees** - Parallel development branches
- **finishing-a-development-branch** - Merge/PR decision workflow
- **subagent-driven-development** - Fast iteration with two-stage review (spec compliance, then code quality)

**Meta**
- **writing-skills** - Create new skills following best practices (includes testing methodology)
- **using-superpowers** - Introduction to the skills system

## Philosophy

- **Test-Driven Development** - Write tests first, always
- **Systematic over ad-hoc** - Process over guessing
- **Complexity reduction** - Simplicity as primary goal
- **Evidence over claims** - Verify before declaring success

Read more: [Superpowers for Claude Code](https://blog.fsck.com/2025/10/09/superpowers/)

## Contributing

Skills live directly in this repository. To contribute:

1. Fork the repository
2. Create a branch for your skill
3. Follow the `writing-skills` skill for creating and testing new skills
4. Submit a PR

See `skills/writing-skills/SKILL.md` for the complete guide.

## Updating

Skills update automatically when you update the plugin:

```bash
/plugin update superpowers
```

## License

MIT License - see LICENSE file for details

## Community

Superpowers is built by [Jesse Vincent](https://blog.fsck.com) and the rest of the folks at [Prime Radiant](https://primeradiant.com).

- **Discord**: [Join us](https://discord.gg/Jd8Vphy9jq) for community support, questions, and sharing what you're building with Superpowers
- **Issues**: https://github.com/obra/superpowers/issues
- **Release announcements**: [Sign up](https://primeradiant.com/superpowers/) to get notified about new versions
