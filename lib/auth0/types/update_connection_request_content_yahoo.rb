# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=yahoo
    class UpdateConnectionRequestContentYahoo < Internal::Types::Model
      field :options, -> { Auth0::Types::ConnectionOptionsYahoo }, optional: true, nullable: false
    end
  end
end
