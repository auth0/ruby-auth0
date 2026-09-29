# frozen_string_literal: true

module Auth0
  module Types
    class ListSegmentsResponseContent < Internal::Types::Model
      field :segments, -> { Internal::Types::Array[Auth0::Types::Segment] }, optional: false, nullable: false

      field :next_, -> { String }, optional: true, nullable: false, api_name: "next"
    end
  end
end
