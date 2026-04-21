# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=line
    class CreateConnectionRequestContentLine < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentLineStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsLine }, optional: true, nullable: false
    end
  end
end
