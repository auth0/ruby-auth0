# frozen_string_literal: true

module Auth0
  module Types
    class SetGuardianFactorsProviderPushNotificationApnsResponseContent < Internal::Types::Model
      field :sandbox, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :bundle_id, -> { String }, optional: true, nullable: false
    end
  end
end
