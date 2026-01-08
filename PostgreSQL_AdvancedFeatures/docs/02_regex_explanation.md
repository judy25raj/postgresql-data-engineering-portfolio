# Regular Expression on taxdata.purpose – Explanation

## Goal

Use a PostgreSQL regular expression to find rows in `taxdata.purpose` where:

- The **first character** is uppercase (`A–Z`)
- The **second character** is lowercase (`a–z`)

Correct regex pattern:

```regex
^[A-Z][a-z]
```

Example query (against readonly DB):

```sql
SELECT purpose
FROM taxdata
WHERE purpose ~ '^[A-Z][a-z]'
ORDER BY purpose DESC
LIMIT 3;
```

This returns purposes such as:

- "Zumas Rescue Ranch serves as advocate..."  
- "Zulu Nation's purpose is to raise social awareness..."  

This shows understanding of:

- `~` regex operator in PostgreSQL
- `^` for start-of-string
- character classes `[A-Z]`, `[a-z]`
