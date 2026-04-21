# frozen_string_literal: true

class ApiController < ApplicationController
  before_action :validate_token!, only: %i[private_endpoint]

  # Public endpoint -- no authentication required.
  def public_endpoint
    render json: { message: "Hello from a public endpoint! You don't need to be authenticated to see this." }
  end

  # Protected endpoint -- requires a valid Auth0 JWT.
  def private_endpoint
    render json: { message: "Hello from a private endpoint!", sub: @current_claims["sub"] }
  end

  # Management API example -- lists users via the Auth0 SDK.
  def users
    user_list = []
    auth0_client.users.list(per_page: 5).each do |u|
      user_list << { email: u.email, user_id: u.user_id }
    end
    render json: user_list
  end
end
