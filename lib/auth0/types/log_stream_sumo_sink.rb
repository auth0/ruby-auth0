# frozen_string_literal: true

module Auth0
  module Types
    class LogStreamSumoSink < Internal::Types::Model
      field :sumo_source_address, -> { String }, optional: false, nullable: false, api_name: "sumoSourceAddress"
    end
  end
end
