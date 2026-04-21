# frozen_string_literal: true

module Auth0
  module Types
    # Options for the 'oauth1' connection
    class ConnectionOptionsOAuth1 < Internal::Types::Model
      field :access_token_url, -> { String }, optional: true, nullable: false, api_name: "accessTokenURL"
      field :client_id, -> { String }, optional: true, nullable: false
      field :client_secret, -> { String }, optional: true, nullable: false
      field :request_token_url, -> { String }, optional: true, nullable: false, api_name: "requestTokenURL"
      field :scripts, -> { Auth0::Types::ConnectionScriptsOAuth1 }, optional: true, nullable: false
      field :signature_method, -> { Auth0::Types::ConnectionSignatureMethodOAuth1 }, optional: true, nullable: false, api_name: "signatureMethod"
      field :upstream_params, -> { Internal::Types::Hash[String, Auth0::Types::ConnectionUpstreamAdditionalProperties] }, optional: true, nullable: false
      field :user_authorization_url, -> { String }, optional: true, nullable: false, api_name: "userAuthorizationURL"
    end
  end
end
