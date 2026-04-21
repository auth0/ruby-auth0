# frozen_string_literal: true

module Auth0
  module Types
    # Adobe EchoSign SSO configuration.
    class ClientAddonEchoSign < Internal::Types::Model
      field :domain, -> { String }, optional: true, nullable: false
    end
  end
end
