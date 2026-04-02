#!/usr/bin/env bash

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$REPO_ROOT"

echo "=== Test: agent workflow template assets ==="

required_files=(
  "skills/recall-contract-context/SKILL.md"
  "skills/backend-contract-exit-gate/SKILL.md"
  "skills/frontend-contract-entry-gate/SKILL.md"
  "skills/compound-knowledge-summary/SKILL.md"
  "workflows/api-delivery.md"
  "workflows/frontend-consume-api.md"
  "workflows/contract-change.md"
  "knowledge/patterns/dto-semantics.md"
  "knowledge/patterns/envelope-standard.md"
  "knowledge/patterns/openapi-decorator-rules.md"
  "knowledge/patterns/operation-id-rules.md"
  "knowledge/examples/good-api-contract.md"
  "knowledge/examples/bad-api-contract.md"
  "knowledge/incidents/contract-breakages.md"
  "knowledge/summaries/README.md"
  "gates/backend-exit-gate.md"
  "gates/frontend-entry-gate.md"
  "gates/contract-invariants.md"
  "gates/verification-matrix.md"
  "contracts/source-of-truth.md"
  "contracts/openapi-lifecycle.md"
  "contracts/change-policy.md"
  "templates/recall-note.md"
  "templates/compound-summary.md"
  "templates/contract-review.md"
  "templates/gate-report.md"
)

for file in "${required_files[@]}"; do
  if [[ -f "$file" ]]; then
    echo "  [PASS] $file exists"
  else
    echo "  [FAIL] Missing required file: $file"
    exit 1
  fi
done

required_pattern_checks=(
  "skills/backend-contract-exit-gate/SKILL.md::OpenAPI|operationId|2xx|envelope"
  "skills/frontend-contract-entry-gate/SKILL.md::OpenAPI|fresh|generate|client"
  "skills/compound-knowledge-summary/SKILL.md::compound|knowledge|summary|pattern"
  "gates/contract-invariants.md::operationId|2xx|DTO|envelope"
  "contracts/source-of-truth.md::OpenAPI|single source of truth"
  "workflows/api-delivery.md::Recall|Exit Gate|OpenAPI|Compound"
)

for check in "${required_pattern_checks[@]}"; do
  file="${check%%::*}"
  pattern="${check#*::}"
  if grep -Eqi "$pattern" "$file"; then
    echo "  [PASS] $file contains required concepts"
  else
    echo "  [FAIL] $file missing required concepts: $pattern"
    exit 1
  fi
done

echo "=== Agent workflow template asset test passed ==="
