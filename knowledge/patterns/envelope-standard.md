# Envelope Standard

Successful and failed responses should follow one standard envelope so clients can rely on stable top-level semantics.

Recommended shape:

- success flag or success semantics
- concrete `data` payload for successful business DTOs
- optional `meta` for paging or tracing
- structured `error` payload for failures

Rules:

- do not return raw DTOs for some endpoints and envelopes for others
- keep envelope fields stable across services
- `2xx` responses still need concrete business DTOs inside the envelope
- document the envelope in `OpenAPI`
