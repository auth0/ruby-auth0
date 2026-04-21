# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=linkedin
    class UpdateConnectionRequestContentLinkedin < Internal::Types::Model
      field :options, -> { Auth0::Types::ConnectionOptionsLinkedin }, optional: true, nullable: false
    end
  end
end
