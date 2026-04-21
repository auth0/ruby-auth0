# frozen_string_literal: true

module Auth0
  module Types
    class DomainVerificationMethod < Internal::Types::Model
      field :name, -> { Auth0::Types::DomainVerificationMethodNameEnum }, optional: false, nullable: false
      field :record, -> { String }, optional: false, nullable: false
      field :domain, -> { String }, optional: true, nullable: false
    end
  end
end
