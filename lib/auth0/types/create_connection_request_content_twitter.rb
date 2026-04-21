# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=twitter
    class CreateConnectionRequestContentTwitter < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentTwitterStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsTwitter }, optional: true, nullable: false
    end
  end
end
