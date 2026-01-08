# Key-Value Table Trigger – Explanation

## Goal

Create a `keyvalue` table with `created_at` and `updated_at` timestamps where:

- `created_at` is set on insert.
- `updated_at` is automatically refreshed whenever a row is updated.

This is done using:

1. A **PL/pgSQL trigger function**.
2. A **BEFORE UPDATE trigger**.

This is a common pattern for audit fields (`created_at`, `updated_at`) in production systems.
