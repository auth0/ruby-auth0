# frozen_string_literal: true

module Auth0
  module Types
    class CreateEncryptionKeyPublicWrappingResponseContent < Internal::Types::Model
      field :public_key, -> { String }, optional: false, nullable: false
      field :algorithm, -> { Auth0::Types::EncryptionKeyPublicWrappingAlgorithm }, optional: false, nullable: false
    end
  end
end
