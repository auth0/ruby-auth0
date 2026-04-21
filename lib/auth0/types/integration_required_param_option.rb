# frozen_string_literal: true

module Auth0
  module Types
    class IntegrationRequiredParamOption < Internal::Types::Model
      field :value, -> { String }, optional: true, nullable: false
      field :label, -> { String }, optional: true, nullable: false
    end
  end
end
