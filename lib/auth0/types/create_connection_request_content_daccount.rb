# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=daccount
    class CreateConnectionRequestContentDaccount < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentDaccountStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsDaccount }, optional: true, nullable: false
    end
  end
end
