# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionEmailVerifyEmailParams < Internal::Types::Model
      field :email, -> { String }, optional: false, nullable: false
      field :rules, -> { Auth0::Types::FlowActionEmailVerifyEmailParamsRules }, optional: true, nullable: false
    end
  end
end
