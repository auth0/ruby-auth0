require 'base64'
require 'rest-client'
require 'uri'
require 'auth0/mixins/httpproxy'
require 'auth0/mixins/initializer'
require 'auth0/mixins/access_token_struct'
require 'auth0/mixins/api_token_struct'
require 'auth0/api/authentication_endpoints'
require 'auth0/api/v1'
require 'auth0/api/v2'
module Auth0
  # Collecting dependencies here
  module Mixins
    include Auth0::Mixins::HTTPProxy
    include Auth0::Mixins::Initializer
  end
end
