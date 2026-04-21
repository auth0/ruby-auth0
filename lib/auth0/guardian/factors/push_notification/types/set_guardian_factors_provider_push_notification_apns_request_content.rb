# frozen_string_literal: true

module Auth0
  module Guardian
    module Factors
      module PushNotification
        module Types
          class SetGuardianFactorsProviderPushNotificationApnsRequestContent < Internal::Types::Model
            field :sandbox, -> { Internal::Types::Boolean }, optional: true, nullable: false
            field :bundle_id, -> { String }, optional: true, nullable: false
            field :p12, -> { String }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
