# frozen_string_literal: true

module Auth0
  module Types
    # Options for password dictionary policy
    class ConnectionPasswordDictionaryOptions < Internal::Types::Model
      field :enable, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :dictionary, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
