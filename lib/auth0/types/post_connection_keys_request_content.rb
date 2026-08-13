# frozen_string_literal: true

module Auth0
  module Types
    class PostConnectionKeysRequestContent < Internal::Types::Model
      field :signing_alg, -> { Auth0::Types::PostConnectionKeysAlgEnum }, optional: true, nullable: false
    end
  end
end
