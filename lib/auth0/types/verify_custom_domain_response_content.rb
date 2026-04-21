# frozen_string_literal: true

module Auth0
  module Types
    class VerifyCustomDomainResponseContent < Internal::Types::Model
      field :custom_domain_id, -> { String }, optional: false, nullable: false
      field :domain, -> { String }, optional: false, nullable: false
      field :primary, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :status, -> { Auth0::Types::CustomDomainStatusFilterEnum }, optional: false, nullable: false
      field :type, -> { Auth0::Types::CustomDomainTypeEnum }, optional: false, nullable: false
      field :cname_api_key, -> { String }, optional: true, nullable: false
      field :origin_domain_name, -> { String }, optional: true, nullable: false
      field :verification, -> { Auth0::Types::DomainVerification }, optional: true, nullable: false
      field :custom_client_ip_header, -> { String }, optional: true, nullable: false
      field :tls_policy, -> { String }, optional: true, nullable: false
      field :domain_metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false
      field :certificate, -> { Auth0::Types::DomainCertificate }, optional: true, nullable: false
    end
  end
end
