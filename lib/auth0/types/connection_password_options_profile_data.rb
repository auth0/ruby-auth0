# frozen_string_literal: true

module Auth0
  module Types
    # Personal information restriction policy to prevent use of profile data in passwords
    class ConnectionPasswordOptionsProfileData < Internal::Types::Model
      field :active, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :blocked_fields, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
