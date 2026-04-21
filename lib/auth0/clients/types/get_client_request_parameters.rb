# frozen_string_literal: true

module Auth0
  module Clients
    module Types
      class GetClientRequestParameters < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :fields, -> { String }, optional: true, nullable: false
        field :include_fields, -> { Internal::Types::Boolean }, optional: true, nullable: false
      end
    end
  end
end
