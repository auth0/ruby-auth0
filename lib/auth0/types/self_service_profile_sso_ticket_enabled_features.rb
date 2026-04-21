# frozen_string_literal: true

module Auth0
  module Types
    # Specifies which features are enabled for an "edit connection" ticket. Only applicable when connection ID is
    # provided.
    class SelfServiceProfileSSOTicketEnabledFeatures < Internal::Types::Model
      field :sso, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :domain_verification, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :provisioning, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
