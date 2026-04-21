# frozen_string_literal: true

module Auth0
  module Types
    # Options for the 'ad' connection
    class ConnectionOptionsAd < Internal::Types::Model
      field :agent_ip, -> { String }, optional: true, nullable: false, api_name: "agentIP"
      field :agent_mode, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "agentMode"
      field :agent_version, -> { String }, optional: true, nullable: false, api_name: "agentVersion"
      field :brute_force_protection, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :cert_auth, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "certAuth"
      field :certs, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :disable_cache, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :disable_self_service_change_password, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :domain_aliases, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :icon_url, -> { String }, optional: true, nullable: false
      field :ips, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :kerberos, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :set_user_root_attributes, -> { Auth0::Types::ConnectionSetUserRootAttributesEnum }, optional: true, nullable: false
      field :sign_in_endpoint, -> { String }, optional: true, nullable: false, api_name: "signInEndpoint"
      field :tenant_domain, -> { String }, optional: true, nullable: false
      field :thumbprints, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :upstream_params, -> { Internal::Types::Hash[String, Auth0::Types::ConnectionUpstreamAdditionalProperties] }, optional: true, nullable: false
    end
  end
end
