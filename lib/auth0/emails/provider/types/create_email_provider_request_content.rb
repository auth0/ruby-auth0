# frozen_string_literal: true

module Auth0
  module Emails
    module Provider
      module Types
        class CreateEmailProviderRequestContent < Internal::Types::Model
          field :name, -> { Auth0::Types::EmailProviderNameEnum }, optional: false, nullable: false
          field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :default_from_address, -> { String }, optional: true, nullable: false
          field :credentials, -> { Auth0::Types::EmailProviderCredentialsSchema }, optional: false, nullable: false
          field :settings, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
        end
      end
    end
  end
end
