# frozen_string_literal: true

module Auth0
  module Types
    module GroupTypeEnum
      extend Auth0::Internal::Types::Enum

      CONNECTION = "connection"
      ORGANIZATION = "organization"
      TENANT = "tenant"
    end
  end
end
