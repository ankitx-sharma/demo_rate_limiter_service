# ADR 001: Filter-Based Rate Limiting (Demonstration Layer)

### Decision
Use a `OncePerRequestFilter` to demonstrate rate limiting at the infrastructure level.

### Status
Accepted

---

## Why This Decision Matters (Educationally)

This shows learners:
- rate limiting is cross-cutting
- it should run before business logic
- controllers should not enforce limits

---

## Consequences

### Positive
- realistic architecture exposure
- clean separation of concerns
- bridges theory and practice

### Negative
- adds architectural complexity

---

## Educational Outcome

This ADR ensures the project teaches:
- **how rate limiting works**
- **where rate limiting belongs**
