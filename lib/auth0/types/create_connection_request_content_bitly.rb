# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=bitly
    class CreateConnectionRequestContentBitly < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentBitlyStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsBitly }, optional: true, nullable: false
    end
  end
end
