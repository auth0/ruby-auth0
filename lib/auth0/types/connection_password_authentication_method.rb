# frozen_string_literal: true

module Auth0
  module Types
    # Password authentication enablement
    class ConnectionPasswordAuthenticationMethod < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :api_behavior, -> { Auth0::Types::ConnectionAPIBehaviorEnum }, optional: true, nullable: false
      field :signup_behavior, -> { Auth0::Types::ConnectionSignupBehaviorEnum }, optional: true, nullable: false
    end
  end
end
