# Development Dockerfile for Rails
FROM ruby:3.3.1-slim

# Install system dependencies
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    build-essential \
    libpq-dev \
    git \
    curl \
    postgresql-client && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /rails

# Set development environment
ENV RAILS_ENV="development"

# Install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy source code
COPY . .

EXPOSE 3000

# Start Rails server
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
