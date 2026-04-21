# frozen_string_literal: true

module Auth0
  module Types
    # Options for the 'paypal' and 'paypal-sandbox' connections
    class ConnectionOptionsPaypal < Internal::Types::Model
      field :client_id, -> { String }, optional: true, nullable: false
      field :client_secret, -> { String }, optional: true, nullable: false
      field :freeform_scopes, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :scope, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :set_user_root_attributes, -> { Auth0::Types::ConnectionSetUserRootAttributesEnum }, optional: true, nullable: false
      field :address, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :email, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :phone, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :profile, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
