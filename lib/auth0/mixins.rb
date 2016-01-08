require 'httmultiparty'
require 'uri'
require 'auth0/mixins/httparty_proxy'
require 'auth0/mixins/initializer'
require 'auth0/api/authentication_endpoints'
require 'auth0/api/v1'
require 'auth0/api/v2'
module Auth0
  # Collecting dependencies here
  module Mixins
    include Auth0::Mixins::HTTPartyProxy
    include Auth0::Mixins::Initializer
  end
end
