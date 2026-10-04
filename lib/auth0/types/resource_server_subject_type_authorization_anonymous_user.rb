# frozen_string_literal: true

module Auth0
  module Types
    # Access Permissions for anonymous user flows
    class ResourceServerSubjectTypeAuthorizationAnonymousUser < Internal::Types::Model
      field :policy, -> { Auth0::Types::ResourceServerSubjectTypeAuthorizationAnonymousUserPolicyEnum }, optional: true, nullable: false
    end
  end
end
