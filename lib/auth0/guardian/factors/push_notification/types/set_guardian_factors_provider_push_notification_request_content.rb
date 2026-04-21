# frozen_string_literal: true

module Auth0
  module Guardian
    module Factors
      module PushNotification
        module Types
          class SetGuardianFactorsProviderPushNotificationRequestContent < Internal::Types::Model
            field :provider, -> { Auth0::Types::GuardianFactorsProviderPushNotificationProviderDataEnum }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
