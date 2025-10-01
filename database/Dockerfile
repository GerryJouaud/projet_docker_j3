FROM postgres:16-alpine
RUN apk add --no-cache postgresql-contrib
COPY init.sql /docker-entrypoint-initdb.d/
HEALTHCHECK --interval=5s --timeout=3s --retries=5 --start-period=30s \
  CMD pg_isready --host localhost --port 5432 || exit 1