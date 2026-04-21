# frozen_string_literal: true

module Auth0
  module Types
    class FormFlowConfig < Internal::Types::Model
      field :flow_id, -> { String }, optional: false, nullable: false
      field :next_node, -> { Auth0::Types::FormNodePointer }, optional: true, nullable: false
    end
  end
end
