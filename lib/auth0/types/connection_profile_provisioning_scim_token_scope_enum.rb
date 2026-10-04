# frozen_string_literal: true

module Auth0
  module Types
    module ConnectionProfileProvisioningSCIMTokenScopeEnum
      extend Auth0::Internal::Types::Enum

      GET_USERS = "get:users"
      POST_USERS = "post:users"
      PATCH_USERS = "patch:users"
      DELETE_USERS = "delete:users"
      PUT_USERS = "put:users"
    end
  end
end
