# Verification Matrix

| Check | Backend Exit Gate | Frontend Entry Gate |
|---|---|---|
| `OpenAPI` exists and is current | Required | Required |
| `operationId` present | Required | Referenced |
| `2xx` uses concrete DTO | Required | Referenced |
| envelope matches standard | Required | Required |
| client generation succeeds | Optional | Required |
| consumer contract freshness confirmed | N/A | Required |

Use this matrix to classify blockers before claiming progress.
