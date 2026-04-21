# frozen_string_literal: true

module Auth0
  module EventStreams
    module Types
      class ListEventStreamsRequestParameters < Internal::Types::Model
        field :from, -> { String }, optional: true, nullable: false
        field :take, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
