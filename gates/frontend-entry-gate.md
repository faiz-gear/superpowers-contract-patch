# Frontend Entry Gate

This gate blocks frontend API consumption until the contract is fresh.

Blockers:

- frontend is using stale `OpenAPI`
- generated client artifacts are missing
- request methods were hand-written against outdated DTO assumptions
- envelope handling in the frontend does not match the contract

Required evidence:

- latest contract revision or artifact
- diff or freshness check result
- successful client generation result
