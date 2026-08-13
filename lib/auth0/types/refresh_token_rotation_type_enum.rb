# frozen_string_literal: true

module Auth0
  module Types
    module RefreshTokenRotationTypeEnum
      extend Auth0::Internal::Types::Enum

      ROTATING = "rotating"
      NON_ROTATING = "non-rotating"
    end
  end
end
