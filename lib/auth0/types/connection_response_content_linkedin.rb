# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=linkedin
    class ConnectionResponseContentLinkedin < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentLinkedinStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsLinkedin }, optional: true, nullable: false
    end
  end
end
