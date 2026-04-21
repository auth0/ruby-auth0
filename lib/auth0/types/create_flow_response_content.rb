# frozen_string_literal: true

module Auth0
  module Types
    class CreateFlowResponseContent < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :name, -> { String }, optional: false, nullable: false
      field :actions, -> { Internal::Types::Array[Auth0::Types::FlowAction] }, optional: true, nullable: false
      field :created_at, -> { String }, optional: false, nullable: false
      field :updated_at, -> { String }, optional: false, nullable: false
      field :executed_at, -> { String }, optional: true, nullable: false
    end
  end
end
