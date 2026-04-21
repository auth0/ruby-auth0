# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=linkedin
    class CreateConnectionRequestContentLinkedin < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentLinkedinStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsLinkedin }, optional: true, nullable: false
    end
  end
end
