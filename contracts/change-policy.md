# Contract Change Policy

Every contract change must answer:

- which operations changed
- whether DTO semantics changed
- whether the standard envelope changed
- whether the change is backward compatible
- which consumers must regenerate from the latest `OpenAPI`

Minor implementation changes that do not affect the contract may skip consumer regeneration, but any schema-visible change requires fresh artifacts.
