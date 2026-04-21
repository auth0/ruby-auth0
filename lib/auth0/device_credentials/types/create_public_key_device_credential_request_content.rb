# frozen_string_literal: true

module Auth0
  module DeviceCredentials
    module Types
      class CreatePublicKeyDeviceCredentialRequestContent < Internal::Types::Model
        field :device_name, -> { String }, optional: false, nullable: false
        field :type, -> { Auth0::Types::DeviceCredentialPublicKeyTypeEnum }, optional: false, nullable: false
        field :value, -> { String }, optional: false, nullable: false
        field :device_id, -> { String }, optional: false, nullable: false
        field :client_id, -> { String }, optional: true, nullable: false
      end
    end
  end
end
