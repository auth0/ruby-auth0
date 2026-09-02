# frozen_string_literal: true

module Auth0
  module Types
    # Configuration for B2B Integration clients.
    class B2BIntegrationConfiguration < Internal::Types::Model
      field :sso_profiles, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :integration_type, -> { Auth0::Types::B2BIntegrationConfigurationIntegrationTypeEnum }, optional: true, nullable: false
    end
  end
end
