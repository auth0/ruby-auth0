# frozen_string_literal: true

module Auth0
  module Types
    # Change Password page customization.
    class TenantSettingsPasswordPage < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :html, -> { String }, optional: true, nullable: false
    end
  end
end
