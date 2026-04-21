# frozen_string_literal: true

module Auth0
  module Types
    # Access Permissions for client flows
    class ResourceServerSubjectTypeAuthorizationClient < Internal::Types::Model
      field :policy, -> { Auth0::Types::ResourceServerSubjectTypeAuthorizationClientPolicyEnum }, optional: true, nullable: false
    end
  end
end
