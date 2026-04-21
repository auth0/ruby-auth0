# frozen_string_literal: true

module Auth0
  module Types
    # Captures the results of a single action being executed.
    class ActionExecutionResult < Internal::Types::Model
      field :action_name, -> { String }, optional: true, nullable: false
      field :error, -> { Auth0::Types::ActionError }, optional: true, nullable: false
      field :started_at, -> { String }, optional: true, nullable: false
      field :ended_at, -> { String }, optional: true, nullable: false
    end
  end
end
