require "auth0/api/v2/router"
require "auth0/api/v2/clients"
require "auth0/api/v2/users"
require "auth0/api/v2/blacklists"
require "auth0/api/v2/jobs"
require "auth0/api/v2/stats"
module Auth0
  module Api
    module V2
      include Auth0::Api::V2::Router
      include Auth0::Api::V2::Clients
      include Auth0::Api::V2::Users
      include Auth0::Api::V2::Blacklists
      include Auth0::Api::V2::Jobs
      include Auth0::Api::V2::Stats
    end
  end
end
