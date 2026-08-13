# frozen_string_literal: true

module Auth0
  module Types
    # Access Permissions for user flows
    class ResourceServerSubjectTypeAuthorizationUser < Internal::Types::Model
      field :policy, -> { Auth0::Types::ResourceServerSubjectTypeAuthorizationUserPolicyEnum }, optional: true, nullable: false
    end
  end
end
