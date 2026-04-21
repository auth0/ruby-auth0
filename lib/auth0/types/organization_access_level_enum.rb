# frozen_string_literal: true

module Auth0
  module Types
    module OrganizationAccessLevelEnum
      extend Auth0::Internal::Types::Enum

      NONE = "none"
      READONLY = "readonly"
      LIMITED = "limited"
      FULL = "full"
    end
  end
end
