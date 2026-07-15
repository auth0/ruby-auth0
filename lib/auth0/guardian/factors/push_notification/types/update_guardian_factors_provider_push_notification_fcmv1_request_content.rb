# frozen_string_literal: true

module Auth0
  module Guardian
    module Factors
      module PushNotification
        module Types
          class UpdateGuardianFactorsProviderPushNotificationFcmv1RequestContent < Internal::Types::Model
            field :server_credentials, -> { String }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
