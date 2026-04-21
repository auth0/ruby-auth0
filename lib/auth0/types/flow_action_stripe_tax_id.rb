# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionStripeTaxID < Internal::Types::Model
      field :type, -> { String }, optional: false, nullable: false
      field :value, -> { String }, optional: false, nullable: false
    end
  end
end
