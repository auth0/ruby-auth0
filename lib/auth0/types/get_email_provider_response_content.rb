# frozen_string_literal: true

module Auth0
  module Types
    class GetEmailProviderResponseContent < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :default_from_address, -> { String }, optional: true, nullable: false
      field :credentials, -> { Auth0::Types::EmailProviderCredentials }, optional: true, nullable: false
      field :settings, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end
