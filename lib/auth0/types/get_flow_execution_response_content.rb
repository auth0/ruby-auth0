# frozen_string_literal: true

module Auth0
  module Types
    class GetFlowExecutionResponseContent < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :trace_id, -> { String }, optional: false, nullable: false
      field :journey_id, -> { String }, optional: true, nullable: false
      field :status, -> { String }, optional: false, nullable: false
      field :debug, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :created_at, -> { String }, optional: false, nullable: false
      field :updated_at, -> { String }, optional: false, nullable: false
      field :started_at, -> { String }, optional: true, nullable: false
      field :ended_at, -> { String }, optional: true, nullable: false
    end
  end
end
