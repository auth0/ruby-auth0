# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=yandex
    class ConnectionResponseContentYandex < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentYandexStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsYandex }, optional: true, nullable: false
    end
  end
end
