# frozen_string_literal: true

module Auth0
  module Types
    # The connection's options (depend on the connection strategy). To update these options, the
    # `update:connections_options` scope must be present. To verify your changes, also include the
    # `read:connections_options` scope. If this scope is not specified, you will not be able to review the updated
    # object.
    class UpdateConnectionOptions < Internal::Types::Model
      field :validation, -> { Auth0::Types::ConnectionValidationOptions }, optional: true, nullable: false
      field :non_persistent_attrs, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :precedence, -> { Internal::Types::Array[Auth0::Types::ConnectionIdentifierPrecedenceEnum] }, optional: true, nullable: false
      field :attributes, -> { Auth0::Types::ConnectionAttributes }, optional: true, nullable: false
      field :enable_script_context, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :enabled_database_customization, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "enabledDatabaseCustomization"
      field :import_mode, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :configuration, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false
      field :custom_scripts, -> { Auth0::Types::ConnectionCustomScripts }, optional: true, nullable: false, api_name: "customScripts"
      field :authentication_methods, -> { Auth0::Types::ConnectionAuthenticationMethods }, optional: true, nullable: false
      field :passkey_options, -> { Auth0::Types::ConnectionPasskeyOptions }, optional: true, nullable: false
      field :password_policy, -> { Auth0::Types::ConnectionPasswordPolicyEnum }, optional: true, nullable: false, api_name: "passwordPolicy"
      field :password_complexity_options, -> { Auth0::Types::ConnectionPasswordComplexityOptions }, optional: true, nullable: false
      field :password_history, -> { Auth0::Types::ConnectionPasswordHistoryOptions }, optional: true, nullable: false
      field :password_no_personal_info, -> { Auth0::Types::ConnectionPasswordNoPersonalInfoOptions }, optional: true, nullable: false
      field :password_dictionary, -> { Auth0::Types::ConnectionPasswordDictionaryOptions }, optional: true, nullable: false
      field :api_enable_users, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :api_enable_groups, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :basic_profile, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_admin, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_is_suspended, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_agreed_terms, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_groups, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_assigned_plans, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_profile, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :disable_self_service_change_password, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :upstream_params, -> { Internal::Types::Hash[String, Auth0::Types::ConnectionUpstreamAdditionalProperties] }, optional: true, nullable: false
      field :set_user_root_attributes, -> { Auth0::Types::ConnectionSetUserRootAttributesEnum }, optional: true, nullable: false
      field :gateway_authentication, -> { Auth0::Types::ConnectionGatewayAuthentication }, optional: true, nullable: false
      field :federated_connections_access_tokens, -> { Auth0::Types::ConnectionFederatedConnectionsAccessTokens }, optional: true, nullable: false
      field :password_options, -> { Auth0::Types::ConnectionPasswordOptions }, optional: true, nullable: false
    end
  end
end
