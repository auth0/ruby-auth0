# frozen_string_literal: true

module Auth0
  module Types
    class IntegrationRelease < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :trigger, -> { Auth0::Types::ActionTrigger }, optional: true, nullable: false
      field :semver, -> { Auth0::Types::IntegrationSemVer }, optional: true, nullable: false
      field :required_secrets, -> { Internal::Types::Array[Auth0::Types::IntegrationRequiredParam] }, optional: true, nullable: false
      field :required_configuration, -> { Internal::Types::Array[Auth0::Types::IntegrationRequiredParam] }, optional: true, nullable: false
    end
  end
end
