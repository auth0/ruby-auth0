# frozen_string_literal: true

module Auth0
  module Types
    # Options for the 'google-apps' connection
    class ConnectionOptionsGoogleApps < Internal::Types::Model
      field :admin_access_token, -> { String }, optional: true, nullable: false
      field :admin_access_token_expiresin, -> { String }, optional: true, nullable: false
      field :admin_refresh_token, -> { String }, optional: true, nullable: false
      field :allow_setting_login_scopes, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :api_enable_groups, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :api_enable_users, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :client_id, -> { String }, optional: false, nullable: false
      field :client_secret, -> { String }, optional: true, nullable: false
      field :domain, -> { String }, optional: true, nullable: false
      field :domain_aliases, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :email, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_agreed_terms, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_groups, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_groups_extended, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_is_admin, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_is_suspended, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :federated_connections_access_tokens, -> { Auth0::Types::ConnectionFederatedConnectionsAccessTokens }, optional: true, nullable: false
      field :handle_login_from_social, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :icon_url, -> { String }, optional: true, nullable: false
      field :map_user_id_to_id, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :profile, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :scope, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :set_user_root_attributes, -> { Auth0::Types::ConnectionSetUserRootAttributesEnum }, optional: true, nullable: false
      field :tenant_domain, -> { String }, optional: true, nullable: false
      field :upstream_params, -> { Internal::Types::Hash[String, Auth0::Types::ConnectionUpstreamAdditionalProperties] }, optional: true, nullable: false
    end
  end
end
