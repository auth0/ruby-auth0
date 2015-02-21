require 'httparty'
require 'uri'
require "auth0/mixins/httparty_proxy"
require "auth0/mixins/initializer"
require "auth0/api/authentication_endpoints"
require "auth0/api/v1"
require "auth0/api/v2"
# Collecting dependencies here
module Auth0::Mixins
  include Auth0::Mixins::HTTPartyProxy
  include Auth0::Mixins::Initializer
end
