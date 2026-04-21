# frozen_string_literal: true

module Auth0
  module Types
    class DeviceCredential < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :device_name, -> { String }, optional: true, nullable: false
      field :device_id, -> { String }, optional: true, nullable: false
      field :type, -> { Auth0::Types::DeviceCredentialTypeEnum }, optional: true, nullable: false
      field :user_id, -> { String }, optional: true, nullable: false
      field :client_id, -> { String }, optional: true, nullable: false
    end
  end
end
