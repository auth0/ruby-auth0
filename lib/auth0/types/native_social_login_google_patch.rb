# frozen_string_literal: true

module Auth0
  module Types
    # Native Social Login support for the google-oauth2 connection
    class NativeSocialLoginGooglePatch < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
