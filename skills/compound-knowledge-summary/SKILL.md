---
name: compound-knowledge-summary
description: Use when API delivery work is verified and the agent should turn validated lessons into reusable knowledge for future tasks
---

# Compound Knowledge Summary

## Overview

Successful work should compound. After verification, convert durable lessons into repository knowledge so future agents can recall them instead of improvising again.

## When to Use

Use this skill when:

- backend and frontend contract work is verified
- a gate failure exposed a repeatable pattern
- a delivery changed DTO, envelope, naming, or OpenAPI conventions

## Process

1. Summarize what worked, what failed, and what contract assumptions were validated.
2. Record the summary using `templates/compound-summary.md`.
3. Promote stable lessons into `knowledge/patterns` when they are reusable.
4. Record breakages or cautionary cases in `knowledge/incidents`.

## Required Content

- contract surface touched
- which recall items helped
- new knowledge worth preserving
- whether the lesson belongs in `summary`, `pattern`, or `incident`

## Guardrails

- Do not promote unverified guesses into patterns.
- Keep one summary per task or change set.
- Tie new knowledge back to concrete contract behavior.
