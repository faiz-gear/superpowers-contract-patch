# Contract Invariants

The following invariants are non-negotiable for API delivery:

- `OpenAPI` is the contract authority
- every public endpoint has an `operationId`
- every successful `2xx` response maps to a concrete DTO
- every response conforms to the standard envelope
- contract changes must be visible to consumers before integration starts

If any invariant fails, the task is not complete.
