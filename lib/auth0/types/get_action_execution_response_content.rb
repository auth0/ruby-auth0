# frozen_string_literal: true

module Auth0
  module Types
    # The result of a specific execution of a trigger.
    class GetActionExecutionResponseContent < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :trigger_id, -> { Auth0::Types::ActionTriggerTypeEnum }, optional: true, nullable: false
      field :status, -> { Auth0::Types::ActionExecutionStatusEnum }, optional: true, nullable: false
      field :results, -> { Internal::Types::Array[Auth0::Types::ActionExecutionResult] }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :updated_at, -> { String }, optional: true, nullable: false
    end
  end
end
