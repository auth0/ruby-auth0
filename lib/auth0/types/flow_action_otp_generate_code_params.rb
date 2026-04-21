# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionOtpGenerateCodeParams < Internal::Types::Model
      field :reference, -> { String }, optional: false, nullable: false
      field :length, -> { Integer }, optional: false, nullable: false
    end
  end
end
