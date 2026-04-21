# frozen_string_literal: true

module Auth0
  module Types
    class ActionTriggerCompatibleTrigger < Internal::Types::Model
      field :id, -> { Auth0::Types::ActionTriggerTypeEnum }, optional: false, nullable: false
      field :version, -> { String }, optional: false, nullable: false
    end
  end
end
