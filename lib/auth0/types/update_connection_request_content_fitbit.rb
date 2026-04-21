# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=fitbit
    class UpdateConnectionRequestContentFitbit < Internal::Types::Model
      field :options, -> { Auth0::Types::ConnectionOptionsFitbit }, optional: true, nullable: false
    end
  end
end
