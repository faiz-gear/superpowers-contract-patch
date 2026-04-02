# Frontend Consume API Workflow

Frontend API work starts only after the backend contract is publishable.

1. Read the authoritative `OpenAPI` location from `contracts/source-of-truth.md`.
2. Run `frontend-contract-entry-gate`.
3. Compare local contract artifacts against the latest version.
4. Generate or refresh client methods from the new contract.
5. Build UI or data-layer integration on top of those generated methods.
6. Record any new consumer lessons with `compound-knowledge-summary`.

The frontend must not consume stale DTO shapes, stale envelope assumptions, or hand-written request methods that bypass the contract.
