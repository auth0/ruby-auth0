# frozen_string_literal: true

module Auth0
  module DeviceCredentials
    module Types
      class ListDeviceCredentialsRequestParameters < Internal::Types::Model
        field :page, -> { Integer }, optional: true, nullable: false
        field :per_page, -> { Integer }, optional: true, nullable: false
        field :include_totals, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :fields, -> { String }, optional: true, nullable: false
        field :include_fields, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :user_id, -> { String }, optional: true, nullable: false
        field :client_id, -> { String }, optional: true, nullable: false
        field :type, -> { Auth0::Types::DeviceCredentialTypeEnum }, optional: true, nullable: false
      end
    end
  end
end
