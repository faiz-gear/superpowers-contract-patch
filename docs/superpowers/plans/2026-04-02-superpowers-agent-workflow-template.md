# Superpowers Agent Workflow Template Implementation Plan

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development (if subagents available) or superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Turn the cloned `superpowers` repository into a fork-ready agent workflow template with recall, contract, gate, and compound patch layers.

**Architecture:** Keep the original repository layout and add a lightweight enhancement layer through new skills, workflow docs, gate docs, contract policy docs, and reusable templates. Favor additive changes over rewriting core skills so the fork remains recognizably based on upstream `superpowers`.

**Tech Stack:** Markdown documentation, shell-based repository tests, existing `superpowers` skill layout

---

## File Structure

- Create: `docs/superpowers/specs/2026-04-02-superpowers-agent-workflow-template-design.md`
- Create: `docs/superpowers/plans/2026-04-02-superpowers-agent-workflow-template.md`
- Create: `skills/recall-contract-context/SKILL.md`
- Create: `skills/backend-contract-exit-gate/SKILL.md`
- Create: `skills/frontend-contract-entry-gate/SKILL.md`
- Create: `skills/compound-knowledge-summary/SKILL.md`
- Create: `workflows/api-delivery.md`
- Create: `workflows/frontend-consume-api.md`
- Create: `workflows/contract-change.md`
- Create: `knowledge/patterns/dto-semantics.md`
- Create: `knowledge/patterns/envelope-standard.md`
- Create: `knowledge/patterns/openapi-decorator-rules.md`
- Create: `knowledge/patterns/operation-id-rules.md`
- Create: `knowledge/examples/good-api-contract.md`
- Create: `knowledge/examples/bad-api-contract.md`
- Create: `knowledge/incidents/contract-breakages.md`
- Create: `knowledge/summaries/README.md`
- Create: `gates/backend-exit-gate.md`
- Create: `gates/frontend-entry-gate.md`
- Create: `gates/contract-invariants.md`
- Create: `gates/verification-matrix.md`
- Create: `contracts/source-of-truth.md`
- Create: `contracts/openapi-lifecycle.md`
- Create: `contracts/change-policy.md`
- Create: `templates/recall-note.md`
- Create: `templates/compound-summary.md`
- Create: `templates/contract-review.md`
- Create: `templates/gate-report.md`
- Create: `tests/opencode/test-agent-workflow-template.sh`
- Modify: `README.md`

## Chunk 1: Create Failing Repository Test

### Task 1: Add Template Presence Test

**Files:**
- Create: `tests/opencode/test-agent-workflow-template.sh`

- [ ] **Step 1: Write the failing test**

Create a shell test that checks for:
- the four new patch skills
- workflow documents
- gate documents
- contract documents
- knowledge pattern documents
- template files
- key phrases such as `OpenAPI`, `operationId`, `2xx`, `envelope`, and `compound`

- [ ] **Step 2: Run test to verify it fails**

Run: `bash tests/opencode/test-agent-workflow-template.sh`
Expected: FAIL because required files do not exist yet

## Chunk 2: Add Patch-Layer Skills and Knowledge Assets

### Task 2: Create Recall, Gate, and Compound Skills

**Files:**
- Create: `skills/recall-contract-context/SKILL.md`
- Create: `skills/backend-contract-exit-gate/SKILL.md`
- Create: `skills/frontend-contract-entry-gate/SKILL.md`
- Create: `skills/compound-knowledge-summary/SKILL.md`

- [ ] **Step 1: Write minimal skill documents**

Add concise skills that define when to use each patch and what outputs are required.

- [ ] **Step 2: Re-run the template presence test**

Run: `bash tests/opencode/test-agent-workflow-template.sh`
Expected: still FAIL because workflow, gate, contract, and knowledge files are still missing

### Task 3: Create Supporting Workflow, Knowledge, Gate, Contract, and Template Docs

**Files:**
- Create: `workflows/api-delivery.md`
- Create: `workflows/frontend-consume-api.md`
- Create: `workflows/contract-change.md`
- Create: `knowledge/patterns/*.md`
- Create: `knowledge/examples/*.md`
- Create: `knowledge/incidents/contract-breakages.md`
- Create: `knowledge/summaries/README.md`
- Create: `gates/*.md`
- Create: `contracts/*.md`
- Create: `templates/*.md`

- [ ] **Step 1: Add minimal but complete documents**

Ensure each document has one clear responsibility and references the contract-centric workflow.

- [ ] **Step 2: Run the test**

Run: `bash tests/opencode/test-agent-workflow-template.sh`
Expected: PASS once all required assets and phrases exist

## Chunk 3: Expose the Template in Repository Docs

### Task 4: Update README for Fork Usage

**Files:**
- Modify: `README.md`

- [ ] **Step 1: Add a short section describing the fork template**

Explain:
- this fork adds a patch layer
- `OpenAPI` is the single source of truth for API work
- backend exit gate and frontend entry gate protect integration
- compound summaries turn successful work into reusable knowledge

- [ ] **Step 2: Run the repository test again**

Run: `bash tests/opencode/test-agent-workflow-template.sh`
Expected: PASS

## Chunk 4: Final Verification

### Task 5: Verify Changed Files and Repository Status

**Files:**
- Verify all created and modified files

- [ ] **Step 1: Review git diff**

Run: `git status --short` and `git diff --stat`
Expected: only intended template files are added or modified

- [ ] **Step 2: Run the template test one more time**

Run: `bash tests/opencode/test-agent-workflow-template.sh`
Expected: PASS

- [ ] **Step 3: Summarize assumptions and remaining gaps**

Document any intentional limitations, especially that runnable framework-specific generators are not part of this pure-spec template.
