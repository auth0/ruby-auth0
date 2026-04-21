# frozen_string_literal: true

module Auth0
  module Types
    # Event content. This will only be set if delivery failed.
    class EventStreamCloudEvent < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :source, -> { String }, optional: true, nullable: false
      field :specversion, -> { String }, optional: true, nullable: false
      field :type, -> { String }, optional: true, nullable: false
      field :time, -> { String }, optional: true, nullable: false
      field :data, -> { String }, optional: true, nullable: false
    end
  end
end
