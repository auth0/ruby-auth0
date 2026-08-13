# frozen_string_literal: true

module Auth0
  module Types
    class LogStreamSegmentSinkWriteKey < Internal::Types::Model
      field :segment_write_key, -> { String }, optional: false, nullable: false, api_name: "segmentWriteKey"
    end
  end
end
