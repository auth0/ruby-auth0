# frozen_string_literal: true

module Auth0
  module Types
    class GetBreachedPasswordDetectionSettingsResponseContent < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :shields, -> { Internal::Types::Array[Auth0::Types::BreachedPasswordDetectionShieldsEnum] }, optional: true, nullable: false
      field :admin_notification_frequency, -> { Internal::Types::Array[Auth0::Types::BreachedPasswordDetectionAdminNotificationFrequencyEnum] }, optional: true, nullable: false
      field :method_, -> { Auth0::Types::BreachedPasswordDetectionMethodEnum }, optional: true, nullable: false, api_name: "method"
      field :stage, -> { Auth0::Types::BreachedPasswordDetectionStage }, optional: true, nullable: false
    end
  end
end
