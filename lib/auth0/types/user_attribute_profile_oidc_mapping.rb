# frozen_string_literal: true

module Auth0
  module Types
    # OIDC mapping for this attribute
    class UserAttributeProfileOidcMapping < Internal::Types::Model
      field :mapping, -> { String }, optional: false, nullable: false
      field :display_name, -> { String }, optional: true, nullable: false
    end
  end
end
