# frozen_string_literal: true

module Auth0
  module Guardian
    module Factors
      module PushNotification
        module Types
          class UpdateGuardianFactorsProviderPushNotificationFcmRequestContent < Internal::Types::Model
            field :server_key, -> { String }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
