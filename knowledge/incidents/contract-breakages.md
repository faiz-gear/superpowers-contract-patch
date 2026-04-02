# Contract Breakages

Common integration failures worth recalling before API work:

- backend changed DTO field names without updating `OpenAPI`
- frontend generated clients from an old contract revision
- endpoint shipped without `operationId`, breaking API generation
- `2xx` response returned a vague object instead of a concrete DTO
- some endpoints wrapped responses in an envelope while others returned raw objects

Use incident entries to capture:

- what changed
- why the breakage escaped earlier checks
- which gate should block the same issue next time
