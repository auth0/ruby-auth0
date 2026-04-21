# frozen_string_literal: true

module Auth0
  module Connections
    module Types
      class ListConnectionsQueryParameters < Internal::Types::Model
        field :from, -> { String }, optional: true, nullable: false
        field :take, -> { Integer }, optional: true, nullable: false
        field :strategy, -> { Auth0::Types::ConnectionStrategyEnum }, optional: true, nullable: false
        field :name, -> { String }, optional: true, nullable: false
        field :fields, -> { String }, optional: true, nullable: false
        field :include_fields, -> { Internal::Types::Boolean }, optional: true, nullable: false
      end
    end
  end
end
