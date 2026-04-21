# frozen_string_literal: true

module Auth0
  module Types
    class SetGuardianFactorSmsTemplatesResponseContent < Internal::Types::Model
      field :enrollment_message, -> { String }, optional: false, nullable: false
      field :verification_message, -> { String }, optional: false, nullable: false
    end
  end
end
