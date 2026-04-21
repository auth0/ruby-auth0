# frozen_string_literal: true

module Auth0
  module Clients
    module Types
      class ListClientsRequestParameters < Internal::Types::Model
        field :fields, -> { String }, optional: true, nullable: false
        field :include_fields, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :page, -> { Integer }, optional: true, nullable: false
        field :per_page, -> { Integer }, optional: true, nullable: false
        field :include_totals, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :is_global, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :is_first_party, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :app_type, -> { String }, optional: true, nullable: false
        field :external_client_id, -> { String }, optional: true, nullable: false
        field :q, -> { String }, optional: true, nullable: false
      end
    end
  end
end
