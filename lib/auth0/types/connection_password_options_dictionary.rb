# frozen_string_literal: true

module Auth0
  module Types
    # Dictionary-based password restriction policy to prevent common passwords
    class ConnectionPasswordOptionsDictionary < Internal::Types::Model
      field :active, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :custom, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :default, -> { Auth0::Types::PasswordDefaultDictionariesEnum }, optional: true, nullable: false
    end
  end
end
