# OpenAPI Decorator Rules

If the framework uses decorators or annotations to generate `OpenAPI`, treat them as contract code rather than optional comments.

Rules:

- every public operation must emit a stable `operationId`
- every response annotation must point to a concrete DTO
- envelope wrappers must be represented in generated schema, not described only in prose
- examples and descriptions should clarify semantics, not compensate for missing schema

Anti-patterns:

- decorator exists but response schema is still vague
- response type is `object`
- generated contract omits the standard envelope
