# frozen_string_literal: true

module Auth0
  module Users
    module RiskAssessments
      module Types
        class ClearAssessorsRequestContent < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :connection, -> { String }, optional: false, nullable: false
          field :assessors, -> { Internal::Types::Array[Auth0::Types::AssessorsTypeEnum] }, optional: false, nullable: false
        end
      end
    end
  end
end
