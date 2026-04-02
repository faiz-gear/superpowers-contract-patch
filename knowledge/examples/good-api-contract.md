# Good API Contract Example

Traits of a good contract:

- explicit `operationId`
- documented standard envelope
- `2xx` response points to a concrete DTO
- errors use structured schema
- frontend code generation can consume it without manual patching

Example checklist:

- `operationId: getOrderById`
- `200` schema: `OrderEnvelope<OrderDetailDto>`
- paging or trace metadata documented in `meta`
- no ambiguous `object` success schema
