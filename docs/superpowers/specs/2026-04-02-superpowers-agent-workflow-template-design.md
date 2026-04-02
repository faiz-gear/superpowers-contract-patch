# Superpowers Agent Workflow Template Design

## Summary

Create a fork-friendly enhancement layer on top of `superpowers` that keeps the original skill-first philosophy while adding:

- a mandatory pre-implementation knowledge recall step
- hard contract gates around backend completion and frontend consumption
- a post-delivery compound summary step that turns validated work into reusable knowledge
- an `OpenAPI`-centered contract discipline as the shared source of truth across backend and frontend

This design targets a **pure specification repository** rather than a framework-specific implementation. It should be reusable across teams and projects that want stronger long-running agent discipline without hard-coding implementation prompts.

## Goals

- Preserve the original `superpowers` workflow shape instead of replacing it with a new framework.
- Add medium-intrusion patch points around design, planning, implementation, and completion.
- Make prior API experience recallable as structured knowledge instead of buried in past sessions.
- Enforce backend exit and frontend entry gates from one contract authority.
- Keep implementation details flexible and delegated to model capability.
- Provide a repository template teams can fork and adapt.

## Non-Goals

- Defining a specific backend framework such as NestJS.
- Defining a specific frontend framework integration beyond examples and expectations.
- Shipping executable OpenAPI generators or validators for every stack.
- Rewriting core `superpowers` skills wholesale.
- Replacing project-level conventions that belong in product repositories.

## Approved Design Direction

### Overall Architecture

This template is a `Superpowers Patch Layer`.

It keeps the original `superpowers` spine:

- `brainstorming`
- `writing-plans`
- implementation
- verification

It then adds four patch capabilities:

- `Recall Patch`
- `Contract Patch`
- `Gate Patch`
- `Compound Patch`

The central control idea is:

- skills govern workflow transitions
- knowledge files capture reusable experience
- gate documents define hard acceptance thresholds
- `OpenAPI` governs cross-team contract truth

### Repository Structure

The repository should contain:

- `skills/` for workflow-driving skills
- `workflows/` for cross-skill delivery flows
- `knowledge/` for reusable patterns, incidents, and summaries
- `gates/` for hard acceptance criteria
- `contracts/` for source-of-truth policy
- `templates/` for standardized intermediate artifacts
- `docs/superpowers/specs` and `docs/superpowers/plans` for design and execution planning

The structure should separate:

- process guidance
- reusable knowledge
- contract policy
- verification requirements

This separation keeps skills concise while reducing entropy during long-running agent work.

## Components

### 1. Recall Patch

Purpose:

- force the agent to inspect validated prior knowledge before implementation
- reduce rediscovery of known DTO, envelope, and decorator rules
- make project experience retrievable as explicit artifacts

Responsibilities:

- identify the relevant contract surface for the task
- load matching knowledge from `knowledge/patterns`, `knowledge/examples`, and `knowledge/incidents`
- produce a short structured recall note before implementation starts
- distinguish stable rules from task-specific inferences

Expected outputs:

- recall note with known invariants
- cited prior examples
- unresolved contract questions

### 2. Contract Patch

Purpose:

- elevate contract work into an explicit lifecycle stage without replacing the base planning workflow

Responsibilities:

- define that `OpenAPI` is the single source of truth for interface work
- require contract-facing tasks to name the affected endpoints and DTO surfaces
- require operation naming and response-envelope expectations to be explicit

Expected outputs:

- contract impact summary
- list of affected operations and DTOs
- confirmation of authoritative contract location

### 3. Backend Exit Gate

Purpose:

- block “implementation complete” claims unless the produced interface is valid, recognizable, and consumable

Hard requirements:

- every public endpoint has a stable `operationId`
- every `2xx` response resolves to a concrete business DTO
- every response conforms to the standard envelope
- OpenAPI output reflects the implementation as shipped

Expected outputs:

- gate report with pass/fail per invariant
- references to failed checks
- explicit stop signal when any blocker fails

### 4. Frontend Entry Gate

Purpose:

- block API consumption work until the frontend is aligned with the latest contract

Hard requirements:

- compare current OpenAPI document against the expected authoritative version
- refresh generated client artifacts from the latest contract before implementation
- start UI/API integration work only after regeneration succeeds

Expected outputs:

- contract freshness check
- generated-client confirmation
- consumer readiness report

### 5. Compound Patch

Purpose:

- convert validated delivery lessons into reusable knowledge after the task is complete

Responsibilities:

- summarize what contract assumptions held
- document which prior recall entries helped
- capture new DTO, envelope, naming, or failure insights
- promote recurring lessons into stable patterns when warranted

Expected outputs:

- task summary in `knowledge/summaries`
- optional promotion into `knowledge/patterns` or `knowledge/incidents`

## Data Flow

The expected flow is:

1. `brainstorming` defines the feature or interface change.
2. `writing-plans` produces execution steps and identifies contract touch points.
3. `Recall Patch` loads prior interface knowledge and writes a recall note.
4. implementation proceeds with flexible model-driven execution.
5. `Backend Exit Gate` checks contract validity and blocks completion if invariants fail.
6. updated `OpenAPI` becomes the publishable contract artifact.
7. `Frontend Entry Gate` verifies the latest contract and regenerates client-side consumption artifacts.
8. integration work proceeds.
9. `Compound Patch` records validated knowledge for future recall.

The flow is intentionally strict at boundaries and intentionally flexible inside implementation.

## Error Handling

Failure behavior should be explicit:

- if recall material is missing, the agent may proceed only after recording the knowledge gap
- if contract authority is ambiguous, work stops until the authoritative source is identified
- if backend exit checks fail, the task remains incomplete regardless of code status
- if frontend freshness checks fail, consumption work must not start
- if compound summarization cannot classify a lesson as stable, it remains in summaries rather than patterns

This keeps the system conservative at decision boundaries without freezing implementation details.

## Testing Strategy

Testing should focus on repository-level workflow integrity rather than framework-specific runtime behavior.

Required verification layers:

- presence tests for new skills and workflow documents
- static tests that critical gate and knowledge files exist
- content sanity checks for required concepts such as `OpenAPI`, `operationId`, `2xx`, `envelope`, and `compound`
- optional harness-level skill tests later if the fork adopts active evaluation

The template should ship with at least one repository-level shell test that fails when required patch-layer assets are missing.

## Open Questions

- whether future versions should add runnable sample scripts for OpenAPI diffing and code generation
- whether some patch skills should eventually replace original commands rather than coexist beside them
- how far to go in adding harness-specific adapters without compromising template portability
