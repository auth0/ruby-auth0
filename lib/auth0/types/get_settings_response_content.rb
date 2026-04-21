# frozen_string_literal: true

module Auth0
  module Types
    class GetSettingsResponseContent < Internal::Types::Model
      field :universal_login_experience, -> { Auth0::Types::UniversalLoginExperienceEnum }, optional: true, nullable: false
      field :identifier_first, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :webauthn_platform_first_factor, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
