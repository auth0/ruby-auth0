# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionOtpVerifyCodeParams < Internal::Types::Model
      field :reference, -> { String }, optional: false, nullable: false
      field :code, -> { Auth0::Types::FlowActionOtpVerifyCodeParamsCode }, optional: false, nullable: false
    end
  end
end
