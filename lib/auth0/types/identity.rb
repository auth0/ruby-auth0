# frozen_string_literal: true

module Auth0
  module Types
    # This must be provided to verify primary social, enterprise and passwordless email identities. Also, is needed to
    # verify secondary identities.
    class Identity < Internal::Types::Model
      field :user_id, -> { String }, optional: false, nullable: false
      field :provider, -> { Auth0::Types::IdentityProviderEnum }, optional: false, nullable: false
      field :connection_id, -> { String }, optional: true, nullable: false
    end
  end
end
