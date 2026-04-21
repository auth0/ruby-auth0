# frozen_string_literal: true

module Auth0
  module Types
    # Certificate information. This object is relevant only for Custom Domains with Auth0-Managed Certificates.
    class DomainCertificate < Internal::Types::Model
      field :status, -> { Auth0::Types::DomainCertificateStatusEnum }, optional: true, nullable: false
      field :error_msg, -> { String }, optional: true, nullable: false
      field :certificate_authority, -> { Auth0::Types::DomainCertificateAuthorityEnum }, optional: true, nullable: false
      field :renews_before, -> { String }, optional: true, nullable: false
    end
  end
end
