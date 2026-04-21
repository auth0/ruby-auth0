# frozen_string_literal: true

module Auth0
  module Types
    class FormFieldPaymentConfig < Internal::Types::Model
      field :provider, -> { Auth0::Types::FormFieldPaymentConfigProviderEnum }, optional: true, nullable: false
      field :charge, -> { Auth0::Types::FormFieldPaymentConfigCharge }, optional: false, nullable: false
      field :credentials, -> { Auth0::Types::FormFieldPaymentConfigCredentials }, optional: false, nullable: false
      field :customer, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :fields, -> { Auth0::Types::FormFieldPaymentConfigFields }, optional: true, nullable: false
    end
  end
end
