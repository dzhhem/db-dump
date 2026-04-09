#!/usr/bin/env bash
# ================================================================
#  db-dump.sh — PostgreSQL database dump
#  Reads connection details from .env
#  Usage: bash scripts/db-dump.sh
# ================================================================

# Load .env from project root
if [[ -f ".env" ]]; then
  export $(grep -v '^#' .env | xargs)
else
  echo "❌  .env file not found. Run from the project root." >&2; exit 1
fi

DUMPS_DIR="dumps/db"
mkdir -p "$DUMPS_DIR"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
OUTPUT="${DUMPS_DIR}/backup-${DATE}.sql"

PGPASSWORD=$DB_PASSWORD pg_dump \
  -U $DB_USER \
  -h $DB_HOST \
  -p $DB_PORT \
  -d $DB_NAME \
  > "$OUTPUT"

echo "✅  DB dump saved → ./${OUTPUT}"