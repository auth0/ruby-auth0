# frozen_string_literal: true

module Auth0
  module Types
    module SelfServiceProfileSSOTicketProvisioningScopeEnum
      extend Auth0::Internal::Types::Enum

      GET_USERS = "get:users"
      POST_USERS = "post:users"
      PUT_USERS = "put:users"
      PATCH_USERS = "patch:users"
      DELETE_USERS = "delete:users"
      GET_GROUPS = "get:groups"
      POST_GROUPS = "post:groups"
      PUT_GROUPS = "put:groups"
      PATCH_GROUPS = "patch:groups"
      DELETE_GROUPS = "delete:groups"
    end
  end
end
