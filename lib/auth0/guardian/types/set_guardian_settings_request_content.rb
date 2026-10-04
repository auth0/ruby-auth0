# frozen_string_literal: true

module Auth0
  module Guardian
    module Types
      class SetGuardianSettingsRequestContent < Internal::Types::Model
        field :display_remember_me_checkbox, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :remember_me_default_value, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :mfa_session_inactivity_timeout, -> { Integer }, optional: false, nullable: false

        field :mfa_session_overall_timeout, -> { Integer }, optional: false, nullable: false
      end
    end
  end
end
