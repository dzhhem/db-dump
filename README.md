# DB Dump

`db-dump.sh` is a simple Bash script for creating PostgreSQL database dumps. It automatically reads connection details from your `.env` file — no manual input required.

## Features

- **Auto Configuration:** Reads `DATABASE_URL` from `.env`.
- **Flexible ENV Path:** Accepts a custom path to `.env` file via `-e` / `--env` argument.
- **Timestamped Output:** Each dump file is named with the current date and time to avoid overwrites.
- **Organized Storage:** Saves all dumps to `dumps/db/` directory.
- **Named Arguments:** Supports short (`-e`) and long (`--env`) flags.

## Usage

Ensure the script is executable:
```bash
chmod +x scripts/db-dump.sh
```

### Run with default `.env`
```bash
bash scripts/db-dump.sh
```

### Run with a custom `.env` path
```bash
bash scripts/db-dump.sh -e apps/api/.env
```

Output: `dumps/db/backup-2026-04-09_14-30-00.sql`

## .env configuration

The following variable must be present in your `.env` file:
```
DATABASE_URL=postgresql://postgres:your_password@localhost:5432/your_db
```

## Requirements

- `bash`
- `pg_dump` (comes with PostgreSQL)

## .gitignore recommendation

Add the following to your `.gitignore` to avoid committing dump files:
```
# Dumps (e.g. database dumps, codebase dumps, etc.)
dumps/
```