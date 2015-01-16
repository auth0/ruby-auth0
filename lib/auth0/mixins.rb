require 'httparty'
require 'uri'
require "auth0/mixins/initializer"
require "auth0/mixins/httparty_proxy"
require "auth0/api/authentication_endpoints"
require "auth0/api/v1"
# Collecting dependencies here
module Auth0::Mixins
  include Auth0::Mixins::HTTPartyProxy
  include Auth0::Mixins::Initializer
  include Auth0::Api::AuthenticationEndpoints
  include Auth0::Api::V1
end
