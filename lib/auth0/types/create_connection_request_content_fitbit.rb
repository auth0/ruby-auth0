# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=fitbit
    class CreateConnectionRequestContentFitbit < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentFitbitStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsFitbit }, optional: true, nullable: false
    end
  end
end
