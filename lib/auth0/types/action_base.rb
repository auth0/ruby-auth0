# frozen_string_literal: true

module Auth0
  module Types
    # The action to which this version belongs.
    class ActionBase < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :supported_triggers, -> { Internal::Types::Array[Auth0::Types::ActionTrigger] }, optional: true, nullable: false
      field :all_changes_deployed, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :updated_at, -> { String }, optional: true, nullable: false
    end
  end
end
