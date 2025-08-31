# problem 196.  delete all duplicate emails
We have a Table: `Person` with columns:
- id (int, Pk) 
- email (varchar)

Goal: delete all duplicate emails, keeping only one unique email with the smallest `id`.

---

## problem Type (pattern)
- Deduplication

## Key Tools
- Window function (ROW_NUMBER() / RANK())
- Subquries
- DELETE statement

---

## pattern Generalization
When faced duplicate rows but need to keep only one:
- Use `ROW_NUMBER()` or `RANK()` to number duplicates
- Delete where row_num > 1
- OR use `GROUP BY` + MIN(id) 
