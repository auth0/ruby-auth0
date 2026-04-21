# frozen_string_literal: true

module Auth0
  module Types
    # Configuration specific to an eventbridge destination.
    class EventStreamEventBridgeConfiguration < Internal::Types::Model
      field :aws_account_id, -> { String }, optional: false, nullable: false
      field :aws_region, -> { Auth0::Types::EventStreamEventBridgeAwsRegionEnum }, optional: false, nullable: false
      field :aws_partner_event_source, -> { String }, optional: true, nullable: false
    end
  end
end
