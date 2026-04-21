# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=yandex
    class UpdateConnectionRequestContentYandex < Internal::Types::Model
      field :options, -> { Auth0::Types::ConnectionOptionsYandex }, optional: true, nullable: false
    end
  end
end
