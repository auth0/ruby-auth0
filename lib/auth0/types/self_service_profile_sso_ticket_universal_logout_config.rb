# frozen_string_literal: true

module Auth0
  module Types
    # Configuration for the setup of Universal Logout in the Self-Service Enterprise Configuration flow.
    class SelfServiceProfileSSOTicketUniversalLogoutConfig < Internal::Types::Model
      field :allow_configuration, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
