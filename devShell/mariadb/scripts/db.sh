#!/usr/bin/env bash
set -e

CMD="$1"
BASE_DIR="$(pwd)/.mariadb"
DATA_DIR="$BASE_DIR/data"
SOCKET="$BASE_DIR/mysql.sock"
PID_FILE="$BASE_DIR/mysql.pid"
LOG_FILE="$BASE_DIR/mysql.log"

mkdir -p "$BASE_DIR"

case "$CMD" in
  up)
    if [ ! -d "$DATA_DIR/mysql" ]; then
      echo "Init mariadb"
      mariadb-install-db \
        --datadir="$DATA_DIR" \
        --auth-root-authentication-method=normal \
        > /dev/null
    fi

    echo "Starting mariadb"
    mariadbd \
      --datadir="$DATA_DIR" \
      --socket="$SOCKET" \
      --port=3306 \
      --bind-address=127.0.0.1 \
      --pid-file="$PID_FILE" \
      --log-error="$LOG_FILE" &

    echo "Waiting for mariadb to be ready..."
    for i in {1..30}; do
      if mariadb-admin --socket="$SOCKET" ping &>/dev/null; then
        break
      fi
      sleep 1
    done

    echo "Creating database 'localdb'..."
    mariadb --socket="$SOCKET" -u root -e "CREATE DATABASE IF NOT EXISTS localdb;"

    clear

    echo ""
    echo "========================================"
    echo "  Host: 127.0.0.1"
    echo "  Port: 3306"
    echo "  User: root"
    echo "  Password: (no password)"
    echo "  Database: localdb"
    echo "========================================"
    echo ""
  ;;

  down)
    echo "Stopping mariadb"
    if [ -f "$PID_FILE" ]; then
      kill "$(cat "$PID_FILE")" || true
    fi
  ;;

  status)
    [ -f "$PID_FILE" ] && echo "MariaDB running" || echo "MariaDB stopped"
  ;;

  *)
    echo "Usage: db {up|down|status}"
    exit 1
  ;;
esac
