# Source of Truth

For API-facing work, `OpenAPI` is the single source of truth.

That means:

- backend implementation must emit or update the authoritative contract
- frontend generation and integration must consume that contract
- docs, SDKs, and examples derive from the same contract artifact

If code and `OpenAPI` disagree, the contract is wrong until reconciled and no side should proceed as if aligned.
