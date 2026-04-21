# frozen_string_literal: true

class ApplicationController < ActionController::API
  private

  # Fetch the JWKS from Auth0 and cache it for the lifetime of the process.
  def jwks
    @@jwks ||= begin
      uri = URI("https://#{ENV.fetch('AUTH0_DOMAIN')}/.well-known/jwks.json")
      response = Net::HTTP.get(uri)
      JSON.parse(response)
    end
  end

  # Validate the Bearer token from the Authorization header using RS256.
  # Returns the decoded claims hash or renders a 401 error.
  def validate_token!
    auth_header = request.headers["Authorization"]
    unless auth_header
      render json: { error: "Missing Authorization header" }, status: :unauthorized
      return
    end

    token = auth_header.split(" ").last

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

    @current_claims = decoded.first
  rescue JWT::DecodeError => e
    render json: { error: "Invalid token: #{e.message}" }, status: :unauthorized
  end

  def auth0_client
    Rails.application.config.auth0_client
  end
end
