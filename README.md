# DB Dump

`db-dump.sh` is a simple Bash script for creating PostgreSQL database dumps. It automatically reads connection details from your `.env` file — no manual input required.

## Features

- **Auto Configuration:** Reads `DB_HOST`, `DB_USER`, `DB_PASSWORD`, `DB_NAME` and `DB_PORT` from `.env`.
- **Flexible ENV Path:** Accepts a custom path to `.env` file as an argument.
- **Timestamped Output:** Each dump file is named with the current date and time to avoid overwrites.
- **Organized Storage:** Saves all dumps to `dumps/db/` directory.

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
bash scripts/db-dump.sh apps/api/.env
```

Output: `dumps/db/backup-2026-04-09_14-30-00.sql`

## .env configuration

The following variables must be present in your `.env` file:
```
DB_HOST=localhost
DB_PORT=5432
DB_USER=postgres
DB_PASSWORD=your_password
DB_NAME=your_database
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