#!/usr/bin/env bash
set -e

CMD="$1"
BASE_DIR="$(pwd)/.postgres"
DATA_DIR="$BASE_DIR/data"
SOCKET_DIR="$BASE_DIR/socket"
LOG_FILE="$BASE_DIR/postgres.log"

export PGHOST="$SOCKET_DIR"
export PGPORT=5432

mkdir -p "$SOCKET_DIR"

case "$CMD" in
  up)
    if [ ! -d "$DATA_DIR" ]; then
      echo "Initdb postgres"
      initdb -D "$DATA_DIR" > /dev/null
    fi

    echo "Starting postgres"
    pg_ctl -D "$DATA_DIR" \
      -o "-k $SOCKET_DIR -p $PGPORT" \
      -l "$LOG_FILE" start

    clear

    echo ""
    echo "========================================"
    echo "  Host: 127.0.0.1"
    echo "  Port: $PGPORT"
    echo "  User: $(whoami)"
    echo "  Password: (no password)"
    echo "  Database: postgres"
    echo "========================================"
    echo ""
  ;;

  down)
    echo "Stopping postgres"
    pg_ctl -D "$DATA_DIR" stop || true
  ;;

  status)
    pg_ctl -D "$DATA_DIR" status || true
  ;;

  *)
    echo "Usage: db {up|down|status}"
    exit 1
  ;;
esac
