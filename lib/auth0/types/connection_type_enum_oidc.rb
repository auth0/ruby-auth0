# frozen_string_literal: true

module Auth0
  module Types
    module ConnectionTypeEnumOidc
      extend Auth0::Internal::Types::Enum

      BACK_CHANNEL = "back_channel"
      FRONT_CHANNEL = "front_channel"
    end
  end
end
