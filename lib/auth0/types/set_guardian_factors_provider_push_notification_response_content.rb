# frozen_string_literal: true

module Auth0
  module Types
    class SetGuardianFactorsProviderPushNotificationResponseContent < Internal::Types::Model
      field :provider, -> { Auth0::Types::GuardianFactorsProviderPushNotificationProviderDataEnum }, optional: true, nullable: false
    end
  end
end
