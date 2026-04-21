# frozen_string_literal: true

module Auth0
  module Connections
    module SCIMConfiguration
      module Tokens
        module Types
          class CreateSCIMTokenRequestContent < Internal::Types::Model
            field :id, -> { String }, optional: false, nullable: false
            field :scopes, -> { Internal::Types::Array[String] }, optional: true, nullable: false
            field :token_lifetime, -> { Integer }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
