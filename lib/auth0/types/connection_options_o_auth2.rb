# frozen_string_literal: true

module Auth0
  module Types
    # Options for the 'oauth2' connection
    class ConnectionOptionsOAuth2 < Internal::Types::Model
      field :auth_params, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false, api_name: "authParams"
      field :auth_params_map, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false, api_name: "authParamsMap"
      field :authorization_url, -> { String }, optional: true, nullable: false, api_name: "authorizationURL"
      field :client_id, -> { String }, optional: true, nullable: false
      field :client_secret, -> { String }, optional: true, nullable: false
      field :custom_headers, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false, api_name: "customHeaders"
      field :fields_map, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false, api_name: "fieldsMap"
      field :icon_url, -> { String }, optional: true, nullable: false
      field :logout_url, -> { String }, optional: true, nullable: false, api_name: "logoutUrl"
      field :pkce_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :scope, -> { Auth0::Types::ConnectionScopeOAuth2 }, optional: true, nullable: false
      field :scripts, -> { Auth0::Types::ConnectionScriptsOAuth2 }, optional: true, nullable: false
      field :set_user_root_attributes, -> { Auth0::Types::ConnectionSetUserRootAttributesEnum }, optional: true, nullable: false
      field :token_url, -> { String }, optional: true, nullable: false, api_name: "tokenURL"
      field :upstream_params, -> { Internal::Types::Hash[String, Auth0::Types::ConnectionUpstreamAdditionalProperties] }, optional: true, nullable: false
      field :use_oauth_spec_scope, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "useOauthSpecScope"
    end
  end
end
