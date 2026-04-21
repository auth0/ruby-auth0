# frozen_string_literal: true

module Auth0
  module Guardian
    module Factors
      module PushNotification
        module Types
          class UpdateGuardianFactorsProviderPushNotificationSnsRequestContent < Internal::Types::Model
            field :aws_access_key_id, -> { String }, optional: true, nullable: false
            field :aws_secret_access_key, -> { String }, optional: true, nullable: false
            field :aws_region, -> { String }, optional: true, nullable: false
            field :sns_apns_platform_application_arn, -> { String }, optional: true, nullable: false
            field :sns_gcm_platform_application_arn, -> { String }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
