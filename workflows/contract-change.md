# Contract Change Workflow

Use this workflow whenever an API contract changes.

1. Identify the affected operations, DTOs, and envelope semantics.
2. Recall prior rules and incidents with `recall-contract-context`.
3. Update implementation and the authoritative `OpenAPI`.
4. Pass the backend exit gate.
5. Notify consumers through the fresh contract artifact.
6. Require consumers to pass the frontend entry gate before integration.
7. Record the result as compound knowledge.

If `OpenAPI` is not updated, the change is incomplete even if code compiles.
