# frozen_string_literal: true

module Auth0
  module Types
    module FeatureFlagConfigParamTypeEnum
      extend Auth0::Internal::Types::Enum

      STRING = "string"
      BOOLEAN = "boolean"
      NUMBER = "number"
      ARRAY = "array"
      OBJECT = "object"
    end
  end
end
