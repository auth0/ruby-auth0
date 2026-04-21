# frozen_string_literal: true

module Auth0
  module Hooks
    module Types
      class ListHooksRequestParameters < Internal::Types::Model
        field :page, -> { Integer }, optional: true, nullable: false
        field :per_page, -> { Integer }, optional: true, nullable: false
        field :include_totals, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :fields, -> { String }, optional: true, nullable: false
        field :trigger_id, -> { Auth0::Types::HookTriggerIDEnum }, optional: true, nullable: false, api_name: "triggerId"
      end
    end
  end
end
