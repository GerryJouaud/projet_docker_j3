#!/bin/sh
# Ensures the Rails application starts correctly in a Docker container

# Wait for PostgreSQL to be ready
if [ -n "$POSTGRES_HOST" ]; then
	echo "Waiting for PostgreSQL to be ready..."
	until pg_isready -h "$POSTGRES_HOST" -U "$POSTGRES_USER" -d "$POSTGRES_DB"; do
		sleep 2
	done
	echo "PostgreSQL is ready!"
fi

# Read the secret from POSTGRES_PASSWORD_FILE if set
if [ -n "$POSTGRES_PASSWORD_FILE" ] && [ -f "$POSTGRES_PASSWORD_FILE" ]; then
	export POSTGRES_PASSWORD=$(cat "$POSTGRES_PASSWORD_FILE")
fi

# Remove server.pid if it exists (for Rails)
if [ -f tmp/pids/server.pid ]; then
	rm tmp/pids/server.pid
fi

# Execute the provided command
exec "$@"