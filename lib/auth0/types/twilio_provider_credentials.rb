# frozen_string_literal: true

module Auth0
  module Types
    class TwilioProviderCredentials < Internal::Types::Model
      field :auth_token, -> { String }, optional: false, nullable: false
    end
  end
end
