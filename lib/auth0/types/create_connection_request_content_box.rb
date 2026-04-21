# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=box
    class CreateConnectionRequestContentBox < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentBoxStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsBox }, optional: true, nullable: false
    end
  end
end
