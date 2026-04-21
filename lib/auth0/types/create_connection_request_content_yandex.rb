# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=yandex
    class CreateConnectionRequestContentYandex < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentYandexStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsYandex }, optional: true, nullable: false
    end
  end
end
