# frozen_string_literal: true

module Auth0
  module Types
    # Options for the 'auth0' connection
    class ConnectionOptionsAuth0 < Internal::Types::Model
      field :attributes, -> { Auth0::Types::ConnectionAttributes }, optional: true, nullable: false
      field :authentication_methods, -> { Auth0::Types::ConnectionAuthenticationMethods }, optional: true, nullable: false
      field :brute_force_protection, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :configuration, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false
      field :custom_scripts, -> { Auth0::Types::ConnectionCustomScripts }, optional: true, nullable: false, api_name: "customScripts"
      field :disable_self_service_change_password, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :disable_signup, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :enable_script_context, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :enabled_database_customization, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "enabledDatabaseCustomization"
      field :import_mode, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :mfa, -> { Auth0::Types::ConnectionMfa }, optional: true, nullable: false
      field :passkey_options, -> { Auth0::Types::ConnectionPasskeyOptions }, optional: true, nullable: false
      field :password_policy, -> { Auth0::Types::ConnectionPasswordPolicyEnum }, optional: true, nullable: false, api_name: "passwordPolicy"
      field :password_complexity_options, -> { Auth0::Types::ConnectionPasswordComplexityOptions }, optional: true, nullable: false
      field :password_dictionary, -> { Auth0::Types::ConnectionPasswordDictionaryOptions }, optional: true, nullable: false
      field :password_history, -> { Auth0::Types::ConnectionPasswordHistoryOptions }, optional: true, nullable: false
      field :password_no_personal_info, -> { Auth0::Types::ConnectionPasswordNoPersonalInfoOptions }, optional: true, nullable: false
      field :password_options, -> { Auth0::Types::ConnectionPasswordOptions }, optional: true, nullable: false
      field :precedence, -> { Internal::Types::Array[Auth0::Types::ConnectionIdentifierPrecedenceEnum] }, optional: true, nullable: false
      field :realm_fallback, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :requires_username, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :validation, -> { Auth0::Types::ConnectionValidationOptions }, optional: true, nullable: false
    end
  end
end
