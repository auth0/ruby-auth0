require 'auth0/api/v1/users'
require 'auth0/api/v1/clients'
require 'auth0/api/v1/connections'
require 'auth0/api/v1/rules'
require 'auth0/api/v1/logs'
module Auth0
  # Space for all API calls
  module Api
    # {https://auth0.com/docs/api}
    # Describing current functionality of Auth0 API V1
    module V1
      include Auth0::Api::V1::Users
      include Auth0::Api::V1::Connections
      include Auth0::Api::V1::Clients
      include Auth0::Api::V1::Rules
      include Auth0::Api::V1::Logs
    end
  end
end
