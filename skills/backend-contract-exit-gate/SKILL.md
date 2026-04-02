---
name: backend-contract-exit-gate
description: Use when backend API work appears complete and the agent must verify the published contract before claiming success
---

# Backend Contract Exit Gate

## Overview

Code is not complete until the contract is publishable. This gate blocks completion unless the backend output is recognizable, typed, and aligned with `OpenAPI`.

## Trigger

Use this skill when:

- an endpoint was added or changed
- DTOs changed
- OpenAPI output changed
- the agent is about to claim backend API work is complete

## Blocking Checks

- every public endpoint has an `operationId`
- every `2xx` response resolves to a concrete business DTO
- every response follows the standard `envelope`
- generated or exported `OpenAPI` matches the implementation

## Process

1. Read `gates/backend-exit-gate.md` and `gates/contract-invariants.md`.
2. Compare the implementation against the authoritative OpenAPI contract.
3. Write a gate report with pass or fail per invariant using `templates/gate-report.md`.
4. Stop the task if any blocker fails.

## Output

Produce one explicit outcome:

- `PASS`: backend contract is publishable
- `FAIL`: do not claim completion; list the blocking invariant failures
