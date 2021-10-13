class DummyClassForTokens
  include Auth0::Mixins::HTTPProxy
  include Auth0::Mixins::Headers
  include Auth0::Mixins::TokenManagement

  def initialize(config)
    @client_id = config[:client_id]
    @client_secret = config[:client_secret]
    @audience = config[:api_identifier]
    @domain = config[:domain]
    @base_uri = "https://#{@domain}"
    @token = config[:token]
    @token_expires_at = config[:token_expires_at]
  end
end