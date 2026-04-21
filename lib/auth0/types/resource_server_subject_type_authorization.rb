# frozen_string_literal: true

module Auth0
  module Types
    # Defines application access permission for a resource server
    class ResourceServerSubjectTypeAuthorization < Internal::Types::Model
      field :user, -> { Auth0::Types::ResourceServerSubjectTypeAuthorizationUser }, optional: true, nullable: false
      field :client, -> { Auth0::Types::ResourceServerSubjectTypeAuthorizationClient }, optional: true, nullable: false
    end
  end
end
