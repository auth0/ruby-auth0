# frozen_string_literal: true

module Auth0
  module Types
    module SignupStatusEnum
      extend Auth0::Internal::Types::Enum

      REQUIRED = "required"
      OPTIONAL = "optional"
      INACTIVE = "inactive"
    end
  end
end
