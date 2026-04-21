# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=daccount
    class ConnectionResponseContentDaccount < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentDaccountStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsDaccount }, optional: true, nullable: false
    end
  end
end
