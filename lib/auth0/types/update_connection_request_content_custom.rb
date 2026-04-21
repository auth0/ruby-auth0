# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=custom
    class UpdateConnectionRequestContentCustom < Internal::Types::Model
      field :options, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end
