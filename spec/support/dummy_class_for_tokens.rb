class DummyClassForTokens
  include Auth0::Mixins::HTTPProxy
  include Auth0::Mixins::Headers
  include Auth0::Mixins::TokenManagement
  include Auth0::Mixins::Initializer

  def initialize(config)
    extend Auth0::Api::AuthenticationEndpoints
    @client_id = config[:client_id]
    @client_secret = config[:client_secret]
    @audience = config[:api_identifier]
    @domain = config[:domain]
    @base_uri = "https://#{@domain}"
    @token = config[:token]
    @token_expires_at = config[:token_expires_at]
    @client_assertion_signing_key = config[:client_assertion_signing_key]
    @client_assertion_signing_alg = config[:client_assertion_signing_alg] || 'RS256'
    @headers ||= {}
  end
end