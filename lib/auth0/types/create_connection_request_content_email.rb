# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=email
    class CreateConnectionRequestContentEmail < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentEmailStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsEmail }, optional: true, nullable: false
    end
  end
end
