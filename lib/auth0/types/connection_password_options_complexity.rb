# frozen_string_literal: true

module Auth0
  module Types
    # Password complexity requirements configuration
    class ConnectionPasswordOptionsComplexity < Internal::Types::Model
      field :min_length, -> { Integer }, optional: true, nullable: false
      field :character_types, -> { Internal::Types::Array[Auth0::Types::PasswordCharacterTypeEnum] }, optional: true, nullable: false
      field :character_type_rule, -> { Auth0::Types::PasswordCharacterTypeRulePolicyEnum }, optional: true, nullable: false
      field :identical_characters, -> { Auth0::Types::PasswordIdenticalCharactersPolicyEnum }, optional: true, nullable: false
      field :sequential_characters, -> { Auth0::Types::PasswordSequentialCharactersPolicyEnum }, optional: true, nullable: false
      field :max_length_exceeded, -> { Auth0::Types::PasswordMaxLengthExceededPolicyEnum }, optional: true, nullable: false
    end
  end
end
