# frozen_string_literal: true

module Auth0
  module Types
    # The user's identity. If you set this value, you must also send the user_id parameter.
    class ChangePasswordTicketIdentity < Internal::Types::Model
      field :user_id, -> { String }, optional: false, nullable: false
      field :provider, -> { Auth0::Types::IdentityProviderOnlyAuth0Enum }, optional: false, nullable: false
      field :connection_id, -> { String }, optional: true, nullable: false
    end
  end
end
