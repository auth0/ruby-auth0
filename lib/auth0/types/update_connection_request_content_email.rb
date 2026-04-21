# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=email
    class UpdateConnectionRequestContentEmail < Internal::Types::Model
      field :options, -> { Auth0::Types::ConnectionOptionsEmail }, optional: true, nullable: false
    end
  end
end
