# frozen_string_literal: true

module Auth0
  module Types
    # Binding is the associative entity joining a trigger, and an action together.
    class ActionBinding < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :trigger_id, -> { Auth0::Types::ActionTriggerTypeEnum }, optional: true, nullable: false
      field :display_name, -> { String }, optional: true, nullable: false
      field :action, -> { Auth0::Types::Action }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :updated_at, -> { String }, optional: true, nullable: false
    end
  end
end
