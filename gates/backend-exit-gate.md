# Backend Exit Gate

This gate blocks backend completion claims for API work.

Blockers:

- authoritative `OpenAPI` is missing or stale
- endpoint lacks `operationId`
- `2xx` response does not map to a concrete DTO
- response schema does not follow the standard envelope
- generated contract and implementation disagree

Required evidence:

- contract artifact location
- list of affected operations
- verification result for each invariant
