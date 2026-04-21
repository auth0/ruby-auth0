# frozen_string_literal: true

# Build an Auth0 Management API client using client credentials.
# Available as Rails.application.config.auth0_client throughout the app.
Rails.application.config.auth0_client = Auth0::Client.new(
  domain: ENV.fetch("AUTH0_DOMAIN"),
  client_id: ENV.fetch("AUTH0_CLIENT_ID"),
  client_secret: ENV.fetch("AUTH0_CLIENT_SECRET")
)
