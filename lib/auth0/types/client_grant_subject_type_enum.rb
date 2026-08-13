# frozen_string_literal: true

module Auth0
  module Types
    module ClientGrantSubjectTypeEnum
      extend Auth0::Internal::Types::Enum

      CLIENT = "client"
      USER = "user"
      ANONYMOUS_USER = "anonymous_user"
    end
  end
end
