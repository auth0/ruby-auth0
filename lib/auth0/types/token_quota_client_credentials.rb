# frozen_string_literal: true

module Auth0
  module Types
    # The token quota configuration
    class TokenQuotaClientCredentials < Internal::Types::Model
      field :enforce, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :per_day, -> { Integer }, optional: true, nullable: false
      field :per_hour, -> { Integer }, optional: true, nullable: false
    end
  end
end
