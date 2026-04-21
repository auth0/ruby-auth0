# frozen_string_literal: true

module Auth0
  module Types
    # Configuration for the email attribute for users.
    class EmailAttribute < Internal::Types::Model
      field :identifier, -> { Auth0::Types::ConnectionAttributeIdentifier }, optional: true, nullable: false
      field :unique, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :profile_required, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :verification_method, -> { Auth0::Types::VerificationMethodEnum }, optional: true, nullable: false
      field :signup, -> { Auth0::Types::SignupVerified }, optional: true, nullable: false
    end
  end
end
