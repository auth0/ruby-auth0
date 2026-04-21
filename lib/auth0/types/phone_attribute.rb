# frozen_string_literal: true

module Auth0
  module Types
    # Configuration for the phone number attribute for users.
    class PhoneAttribute < Internal::Types::Model
      field :identifier, -> { Auth0::Types::ConnectionAttributeIdentifier }, optional: true, nullable: false
      field :profile_required, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :signup, -> { Auth0::Types::SignupVerified }, optional: true, nullable: false
    end
  end
end
