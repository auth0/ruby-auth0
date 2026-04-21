# frozen_string_literal: true

module Auth0
  module Types
    # Metadata related to the device used in the session
    class SessionDeviceMetadata < Internal::Types::Model
      field :initial_user_agent, -> { String }, optional: true, nullable: false
      field :initial_ip, -> { String }, optional: true, nullable: false
      field :initial_asn, -> { String }, optional: true, nullable: false
      field :last_user_agent, -> { String }, optional: true, nullable: false
      field :last_ip, -> { String }, optional: true, nullable: false
      field :last_asn, -> { String }, optional: true, nullable: false
    end
  end
end
