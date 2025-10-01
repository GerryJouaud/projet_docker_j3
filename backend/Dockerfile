# The build stage is used to install dependencies and compile assets
FROM ruby:3.2-alpine AS builder
# Install dependencies
# build-base for compiling native extensions, postgresql-client for pg_isready
RUN apk add --no-cache build-base postgresql-dev postgresql-client yaml-dev
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle config set deployment 'true' && \
    bundle install --without development test && \
    bundle binstubs rails

# The production stage is used to run the application
FROM ruby:3.2-alpine AS production
RUN apk add --no-cache postgresql-dev postgresql-client yaml-dev
WORKDIR /app
# Copy everything from builder (gems + vendor)
COPY --from=builder /app /app
# Copy our app files
COPY . .
# Make sure bin files are executablep
RUN chmod +x bin/* entrypoint.sh
ENV RAILS_ENV=production \
    PATH="/app/bin:$PATH"
# Use entrypoint.sh for robust startup (wait for DB, etc.)
ENTRYPOINT ["./entrypoint.sh"]
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]

# The development stage is used for local development with live code reloading
FROM ruby:3.2-alpine AS development
RUN apk add --no-cache build-base postgresql-dev postgresql-client yaml-dev
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install && \
    bundle binstubs rails
COPY . .
VOLUME ["/app"]
ENV RAILS_ENV=development \
    PATH="/app/bin:$PATH"
ENTRYPOINT ["./entrypoint.sh"]
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]