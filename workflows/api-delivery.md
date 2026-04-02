# API Delivery Workflow

This fork adds a patch layer on top of the normal `superpowers` flow for API work:

1. Run `brainstorming`.
2. Run `writing-plans`.
3. Run `recall-contract-context`.
4. Implement with normal development skills.
5. Run `backend-contract-exit-gate`.
6. Publish or refresh `OpenAPI`.
7. Run `compound-knowledge-summary`.

Required invariants:

- `OpenAPI` is the single source of truth
- every public endpoint has an `operationId`
- every `2xx` response maps to a concrete DTO
- every response obeys the standard envelope

The workflow is strict at boundaries and flexible inside implementation.
