# frozen_string_literal: true

module Auth0
  module Types
    class ListEventStreamsResponseContent < Internal::Types::Model
      field :event_streams, -> { Internal::Types::Array[Auth0::Types::EventStreamResponseContent] }, optional: true, nullable: false, api_name: "eventStreams"
      field :next_, -> { String }, optional: true, nullable: false, api_name: "next"
    end
  end
end
