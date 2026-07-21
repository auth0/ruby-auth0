# frozen_string_literal: true

module Auth0
  module Types
    # Configuration for Third Party Client Access during the Self-Service Enterprise Configuration flow.
    class ThirdPartyClientAccessConfig < Internal::Types::Model
      field :allow_configuration, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
