# frozen_string_literal: true

module Auth0
  module Types
    class BreachedPasswordDetectionStage < Internal::Types::Model
      field :pre_user_registration, -> { Auth0::Types::BreachedPasswordDetectionPreUserRegistrationStage }, optional: true, nullable: false, api_name: "pre-user-registration"
      field :pre_change_password, -> { Auth0::Types::BreachedPasswordDetectionPreChangePasswordStage }, optional: true, nullable: false, api_name: "pre-change-password"
    end
  end
end
