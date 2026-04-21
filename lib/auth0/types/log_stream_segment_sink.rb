# frozen_string_literal: true

module Auth0
  module Types
    class LogStreamSegmentSink < Internal::Types::Model
      field :segment_write_key, -> { String }, optional: true, nullable: false, api_name: "segmentWriteKey"
    end
  end
end
