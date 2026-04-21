# frozen_string_literal: true

module Auth0
  module Types
    # Phone provider configuration schema
    class PhoneProviderSchemaMasked < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :tenant, -> { String }, optional: true, nullable: false
      field :name, -> { Auth0::Types::PhoneProviderNameEnum }, optional: false, nullable: false
      field :channel, -> { Auth0::Types::PhoneProviderChannelEnum }, optional: true, nullable: false
      field :disabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :configuration, -> { Auth0::Types::PhoneProviderConfiguration }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :updated_at, -> { String }, optional: true, nullable: false
    end
  end
end
