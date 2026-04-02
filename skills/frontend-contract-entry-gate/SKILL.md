---
name: frontend-contract-entry-gate
description: Use when frontend work will consume an API and the agent must confirm the latest OpenAPI contract before implementation starts
---

# Frontend Contract Entry Gate

## Overview

Frontend API work starts from the latest contract, not from stale memory. This gate makes `OpenAPI` freshness and client generation mandatory before consumption work begins.

## Trigger

Use this skill when:

- a frontend task depends on API changes
- TanStack Query or other client methods need regeneration
- a team is preparing for frontend and backend integration

## Blocking Checks

- compare the current local contract with the latest authoritative `OpenAPI`
- confirm the frontend is using the fresh contract revision
- generate or refresh client methods from that contract
- stop if generation fails or the contract is stale

## Process

1. Read `gates/frontend-entry-gate.md` and `contracts/source-of-truth.md`.
2. Verify contract freshness.
3. Regenerate client artifacts.
4. Record the outcome in a gate report.

## Output

Produce one explicit outcome:

- `READY`: the frontend may consume the API
- `BLOCKED`: fix freshness or generation issues first
