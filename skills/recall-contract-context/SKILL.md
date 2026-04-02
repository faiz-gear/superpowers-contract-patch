---
name: recall-contract-context
description: Use when planning or implementing API-facing work and the agent needs validated prior contract knowledge before writing code
---

# Recall Contract Context

## Overview

Recall before implementation. Do not rediscover DTO, envelope, naming, or OpenAPI rules from scratch if the repository already contains validated knowledge.

## When to Use

Use this skill when:

- a task changes an API contract
- a task adds or edits DTOs
- a task affects OpenAPI output
- frontend and backend coordination depends on one contract

## Required Inputs

- affected endpoints or contract surface
- expected OpenAPI source location
- any existing related incident or example docs

## Process

1. Search `knowledge/patterns`, `knowledge/examples`, and `knowledge/incidents`.
2. Extract stable constraints separately from task-specific guesses.
3. Write a short recall note using `templates/recall-note.md`.
4. Carry unresolved questions forward into planning or implementation.

## Minimum Output

The recall note must state:

- relevant DTO semantics
- envelope expectations
- OpenAPI or decorator rules
- operation naming constraints
- known failure modes or gaps

## Guardrails

- Prefer validated repository knowledge over prompt improvisation.
- Mark inferences as inferences.
- Missing knowledge is not silent; record the gap.
