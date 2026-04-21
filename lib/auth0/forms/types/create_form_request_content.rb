# frozen_string_literal: true

module Auth0
  module Forms
    module Types
      class CreateFormRequestContent < Internal::Types::Model
        field :name, -> { String }, optional: false, nullable: false
        field :messages, -> { Auth0::Types::FormMessages }, optional: true, nullable: false
        field :languages, -> { Auth0::Types::FormLanguages }, optional: true, nullable: false
        field :translations, -> { Internal::Types::Hash[String, Internal::Types::Hash[String, Object]] }, optional: true, nullable: false
        field :nodes, -> { Internal::Types::Array[Auth0::Types::FormNode] }, optional: true, nullable: false
        field :start, -> { Auth0::Types::FormStartNode }, optional: true, nullable: false
        field :ending, -> { Auth0::Types::FormEndingNode }, optional: true, nullable: false
        field :style, -> { Auth0::Types::FormStyle }, optional: true, nullable: false
      end
    end
  end
end
