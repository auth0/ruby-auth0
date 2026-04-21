# frozen_string_literal: true

module Auth0
  module Types
    class GetHookResponseContent < Internal::Types::Model
      field :trigger_id, -> { String }, optional: true, nullable: false, api_name: "triggerId"
      field :id, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :script, -> { String }, optional: true, nullable: false
      field :dependencies, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false
    end
  end
end
