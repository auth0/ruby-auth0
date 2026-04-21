# frozen_string_literal: true

require "dotenv/load"
require "sinatra/base"
require "json"
require "jwt"
require "net/http"
require "auth0"

# Sinatra API example using the Auth0 Ruby SDK.
#
# This demonstrates:
# - A public endpoint that requires no authentication
# - A protected endpoint that validates an Auth0-issued JWT
# - Using Auth0::Client to call the Management API
class App < Sinatra::Base
  set :port, 3001

  # ---- helpers ----

  helpers do
    # Fetch the JWKS from Auth0 and cache it for the lifetime of the process.
    def jwks
      @jwks ||= begin
        uri = URI("https://#{ENV.fetch('AUTH0_DOMAIN')}/.well-known/jwks.json")
        response = Net::HTTP.get(uri)
        JSON.parse(response)
      end
    end

    # Validate the Bearer token from the Authorization header using RS256.
    def validate_token!
      auth_header = request.env["HTTP_AUTHORIZATION"]
      halt 401, { error: "Missing Authorization header" }.to_json unless auth_header

      token = auth_header.split(" ").last

      # Decode using the JWKS from your Auth0 tenant
      decoded = JWT.decode(
        token,
        nil,
        true,
        algorithms: ["RS256"],
        iss: "https://#{ENV.fetch('AUTH0_DOMAIN')}/",
        aud: ENV.fetch("AUTH0_AUDIENCE"),
        verify_iss: true,
        verify_aud: true,
        jwks: jwks
      )

      decoded.first
    rescue JWT::DecodeError => e
      halt 401, { error: "Invalid token: #{e.message}" }.to_json
    end

    # Build an Auth0 Management API client using client credentials.
    def auth0_client
      @auth0_client ||= Auth0::Client.new(
        domain: ENV.fetch("AUTH0_DOMAIN"),
        client_id: ENV.fetch("AUTH0_CLIENT_ID"),
        client_secret: ENV.fetch("AUTH0_CLIENT_SECRET")
      )
    end
  end

  # ---- routes ----

  # Public endpoint -- no authentication required.
  get "/api/public" do
    content_type :json
    { message: "Hello from a public endpoint! You don't need to be authenticated to see this." }.to_json
  end

  # Protected endpoint -- requires a valid Auth0 JWT.
  get "/api/private" do
    content_type :json
    claims = validate_token!
    { message: "Hello from a private endpoint!", sub: claims["sub"] }.to_json
  end

  # Management API example -- lists users via the Auth0 SDK (no auth required).
  get "/api/users" do
    content_type :json
    users = []
    auth0_client.users.list(per_page: 5).each { |u| users << { email: u.email, user_id: u.user_id } }
    users.to_json
  end
end
