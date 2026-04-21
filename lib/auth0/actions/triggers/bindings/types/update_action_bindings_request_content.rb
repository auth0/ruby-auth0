# frozen_string_literal: true

module Auth0
  module Actions
    module Triggers
      module Bindings
        module Types
          class UpdateActionBindingsRequestContent < Internal::Types::Model
            field :trigger_id, -> { Auth0::Types::ActionTriggerTypeEnum }, optional: false, nullable: false, api_name: "triggerId"
            field :bindings, -> { Internal::Types::Array[Auth0::Types::ActionBindingWithRef] }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
