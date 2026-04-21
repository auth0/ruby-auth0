# frozen_string_literal: true

module Auth0
  module Types
    class SCIMMappingItem < Internal::Types::Model
      field :auth0, -> { String }, optional: true, nullable: false
      field :scim, -> { String }, optional: true, nullable: false
    end
  end
end
