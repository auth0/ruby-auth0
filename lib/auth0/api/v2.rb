require 'auth0/api/v2/blacklists'
require 'auth0/api/v2/clients'
require 'auth0/api/v2/client_grants'
require 'auth0/api/v2/connections'
require 'auth0/api/v2/emails'
require 'auth0/api/v2/jobs'
require 'auth0/api/v2/rules'
require 'auth0/api/v2/stats'
require 'auth0/api/v2/users'
require 'auth0/api/v2/tenants'
require 'auth0/api/v2/tickets'
require 'auth0/api/v2/logs'
require 'auth0/api/v2/resource_servers'

module Auth0
  module Api
    # https://auth0.com/docs/apiv2
    module V2
      include Auth0::Api::V2::Blacklists
      include Auth0::Api::V2::Clients
      include Auth0::Api::V2::ClientGrants
      include Auth0::Api::V2::Connections
      include Auth0::Api::V2::Emails
      include Auth0::Api::V2::Jobs
      include Auth0::Api::V2::Rules
      include Auth0::Api::V2::Stats
      include Auth0::Api::V2::Users
      include Auth0::Api::V2::Tenants
      include Auth0::Api::V2::Tickets
      include Auth0::Api::V2::Logs
      include Auth0::Api::V2::ResourceServers
    end
  end
end
