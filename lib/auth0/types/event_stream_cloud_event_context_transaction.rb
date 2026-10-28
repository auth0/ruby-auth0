# frozen_string_literal: true

module Auth0
  module Types
    # An auth transaction.
    class EventStreamCloudEventContextTransaction < Internal::Types::Model
      field :acr_values, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :locale, -> { String }, optional: false, nullable: false

      field :login_hint, -> { String }, optional: true, nullable: false

      field :prompt, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :protocol, -> { Auth0::Types::EventStreamCloudEventContextTransactionProtocolEnum }, optional: true, nullable: false

      field :redirect_uri, -> { String }, optional: true, nullable: false

      field :requested_scopes, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :response_mode, -> { Auth0::Types::EventStreamCloudEventContextTransactionResponseModeEnum }, optional: true, nullable: false

      field :response_type, -> { Internal::Types::Array[Auth0::Types::EventStreamCloudEventContextTransactionResponseTypeItemEnum] }, optional: true, nullable: false

      field :state, -> { String }, optional: true, nullable: false

      field :ui_locales, -> { Internal::Types::Array[String] }, optional: false, nullable: false
    end
  end
end
