# frozen_string_literal: true

module Auth0
  module Types
    # Authorization policy for the resource server.
    class ResourceServerAuthorizationPolicy < Internal::Types::Model
      field :policy_id, -> { String }, optional: false, nullable: false
    end
  end
end
