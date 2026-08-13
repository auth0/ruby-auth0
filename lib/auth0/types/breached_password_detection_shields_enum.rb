# frozen_string_literal: true

module Auth0
  module Types
    module BreachedPasswordDetectionShieldsEnum
      extend Auth0::Internal::Types::Enum

      BLOCK = "block"
      USER_NOTIFICATION = "user_notification"
      ADMIN_NOTIFICATION = "admin_notification"
    end
  end
end
