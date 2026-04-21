# frozen_string_literal: true

module Auth0
  module EventStreams
    module Deliveries
      module Types
        class ListEventStreamDeliveriesRequestParameters < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :statuses, -> { String }, optional: true, nullable: false
          field :event_types, -> { String }, optional: true, nullable: false
          field :date_from, -> { String }, optional: true, nullable: false
          field :date_to, -> { String }, optional: true, nullable: false
          field :from, -> { String }, optional: true, nullable: false
          field :take, -> { Integer }, optional: true, nullable: false
        end
      end
    end
  end
end
