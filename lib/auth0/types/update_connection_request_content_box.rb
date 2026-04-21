# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=box
    class UpdateConnectionRequestContentBox < Internal::Types::Model
      field :options, -> { Auth0::Types::ConnectionOptionsBox }, optional: true, nullable: false
    end
  end
end
