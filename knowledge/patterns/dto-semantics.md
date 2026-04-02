# DTO Semantics

DTOs should express business meaning, not transport vagueness.

Rules:

- request DTOs describe caller intent
- response DTOs describe concrete business data
- avoid generic `object`, `Record<string, unknown>`, or unlabeled blobs for successful business responses
- one DTO name should imply one stable meaning

Good:

- `CreateOrderRequestDto`
- `OrderSummaryDto`
- `PaginatedOrdersEnvelope`

Bad:

- `ResultDto`
- `AnyObjectResponse`
- `SuccessData`
