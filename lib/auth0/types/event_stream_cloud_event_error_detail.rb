# frozen_string_literal: true

module Auth0
  module Types
    # Error details.
    class EventStreamCloudEventErrorDetail < Internal::Types::Model
      field :code, -> { Auth0::Types::EventStreamCloudEventErrorCodeEnum }, optional: false, nullable: false

      field :message, -> { String }, optional: false, nullable: false

      field :offset, -> { String }, optional: true, nullable: false
    end
  end
end
