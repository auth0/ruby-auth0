# frozen_string_literal: true

module Auth0
  module Types
    # Domain verification settings.
    class DomainVerification < Internal::Types::Model
      field :methods, -> { Internal::Types::Array[Auth0::Types::DomainVerificationMethod] }, optional: true, nullable: false
      field :status, -> { Auth0::Types::DomainVerificationStatusEnum }, optional: true, nullable: false
      field :error_msg, -> { String }, optional: true, nullable: false
      field :last_verified_at, -> { String }, optional: true, nullable: false
    end
  end
end
