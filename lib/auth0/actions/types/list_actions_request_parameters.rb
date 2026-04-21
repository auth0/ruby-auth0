# frozen_string_literal: true

module Auth0
  module Actions
    module Types
      class ListActionsRequestParameters < Internal::Types::Model
        field :trigger_id, -> { Auth0::Types::ActionTriggerTypeEnum }, optional: true, nullable: false, api_name: "triggerId"
        field :action_name, -> { String }, optional: true, nullable: false, api_name: "actionName"
        field :deployed, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :page, -> { Integer }, optional: true, nullable: false
        field :per_page, -> { Integer }, optional: true, nullable: false
        field :installed, -> { Internal::Types::Boolean }, optional: true, nullable: false
      end
    end
  end
end
