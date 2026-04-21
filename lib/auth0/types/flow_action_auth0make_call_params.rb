# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionAuth0MakeCallParams < Internal::Types::Model
      field :from, -> { String }, optional: true, nullable: false
      field :to, -> { String }, optional: false, nullable: false
      field :message, -> { String }, optional: false, nullable: false
      field :custom_vars, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end
