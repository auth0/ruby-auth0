# frozen_string_literal: true

module Auth0
  module Types
    class ListDeviceCredentialsOffsetPaginatedResponseContent < Internal::Types::Model
      field :start, -> { Integer }, optional: true, nullable: false
      field :limit, -> { Integer }, optional: true, nullable: false
      field :total, -> { Integer }, optional: true, nullable: false
      field :device_credentials, -> { Internal::Types::Array[Auth0::Types::DeviceCredential] }, optional: true, nullable: false
    end
  end
end
