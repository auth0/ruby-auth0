# frozen_string_literal: true

module Auth0
  module Types
    class CimdMappedPrivateKeyJwtCredential < Internal::Types::Model
      field :credential_type, -> { String }, optional: false, nullable: false
      field :kid, -> { String }, optional: false, nullable: false
      field :alg, -> { String }, optional: false, nullable: false
    end
  end
end
