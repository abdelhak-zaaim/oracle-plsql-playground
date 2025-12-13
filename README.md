# oracle-plsql-playground

Learning playground for Oracle PL/SQL fundamentals and advanced features. Each folder under `src/` focuses on a specific topic—tables, bulk collection, cursors, error handling, object types, packages, procedures, records, and triggers—so you can run the scripts in isolation or stitch them together as practice exercises.

## Repository Layout
| Path | Purpose |
| --- | --- |
| `src/tables/` | Base schema objects and seed data (`student` table with sample rows).
| `src/bulk-collect/` | Examples showing `BULK COLLECT`, `FORALL`, and in-memory processing.
| `src/cursors/` | Cursor patterns (basic, parameterized, REF cursors) for iterative data access.
| `src/exceptions/` | Techniques for handling predefined and user-defined exceptions.
| `src/functions/` | Standalone function examples, such as computed scoring logic.
| `src/procedures/` | Procedure samples for encapsulated business operations.
| `src/packages/` | Package specs/bodies that group procedures, functions, and variables.
| `src/records/` | Record type usage demonstrations.
| `src/triggers/` | Row-level/business-rule triggers plus scheduler jobs (`jobs.sql`).
| `src/oop/` | Object type definitions and object-oriented PL/SQL constructs.
| `src/general.sql` | Scratchpad snippets (bind variables, quick experiments).
| `docs/`, `data/` | Empty placeholders for future design notes or data exports.

## Prerequisites
- Oracle Database 11g+ (locally or remote)
- SQL*Plus, SQLcl, or any IDE that can execute `.sql` scripts (e.g., SQL Developer)
- A user/schema with privileges to create tables, triggers, procedures, and packages

## Quick Start
1. Clone the repo and open it in your preferred IDE.
2. Connect to your Oracle instance.
3. Run the schema/table script:
   ```bash
   sqlplus user/password@service @src/tables/tables.sql
   ```
4. Execute any topic script you want to practice, for example:
   ```bash
   sqlplus user/password@service @src/bulk-collect/bulk-collect.sql
   ```
5. Inspect `DBMS_OUTPUT` (enable it with `SET SERVEROUTPUT ON`) to view the demo output.

## Suggested Learning Path
1. Start with `src/tables/tables.sql` to create base objects and seed data.
2. Explore `src/cursors/` and `src/records/` to get comfortable with iterative data access patterns.
3. Move to `src/bulk-collect/` and `src/exceptions/` to learn performance tuning and robust error handling.
4. Practice modularization with `src/functions/`, `src/procedures/`, and `src/packages/`.
5. Finish with `src/triggers/` and `src/oop/` to apply business rules and object features.

## Running Selected Exercises
- **Bulk collect**: `@src/bulk-collect/bulk-collect.sql` — loads students into PL/SQL collections, prints emails/ages, updates rows via `FORALL`.
- **Triggers**: `@src/triggers/audit_trg.sql` — enforces `AGE > 18` and demonstrates raising custom errors.
- **Packages**: `@src/packages/app_pkg.pks` / `.pkb` — review spec vs. body differences.

Each script is self-contained, so feel free to tweak the SQL, re-run it, and observe the effects.

## Tips
- Wrap experiments in anonymous blocks to avoid polluting the schema.
- Use `ROLLBACK` after practice runs if you do not want to persist changes.
- Keep `SET DEFINE OFF` and `SET SERVEROUTPUT ON` handy in SQL*Plus sessions.

Happy learning and practicing PL/SQL!

