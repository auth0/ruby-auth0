# frozen_string_literal: true

module Auth0
  module Types
    class FormRouterRule < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :alias_, -> { String }, optional: true, nullable: false, api_name: "alias"
      field :next_node, -> { Auth0::Types::FormNodePointer }, optional: true, nullable: false
    end
  end
end
