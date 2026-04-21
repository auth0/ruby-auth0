# frozen_string_literal: true

module Auth0
  module Types
    # Configuration for the username attribute for users.
    class UsernameAttribute < Internal::Types::Model
      field :identifier, -> { Auth0::Types::ConnectionAttributeIdentifier }, optional: true, nullable: false
      field :profile_required, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :signup, -> { Auth0::Types::SignupSchema }, optional: true, nullable: false
      field :validation, -> { Auth0::Types::UsernameValidation }, optional: true, nullable: false
    end
  end
end
