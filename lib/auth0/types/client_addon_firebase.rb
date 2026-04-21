# frozen_string_literal: true

module Auth0
  module Types
    # Google Firebase addon configuration.
    class ClientAddonFirebase < Internal::Types::Model
      field :secret, -> { String }, optional: true, nullable: false
      field :private_key_id, -> { String }, optional: true, nullable: false
      field :private_key, -> { String }, optional: true, nullable: false
      field :client_email, -> { String }, optional: true, nullable: false
      field :lifetime_in_seconds, -> { Integer }, optional: true, nullable: false
    end
  end
end
