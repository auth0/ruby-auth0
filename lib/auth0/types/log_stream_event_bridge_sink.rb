# frozen_string_literal: true

module Auth0
  module Types
    class LogStreamEventBridgeSink < Internal::Types::Model
      field :aws_account_id, -> { String }, optional: false, nullable: false, api_name: "awsAccountId"
      field :aws_region, -> { Auth0::Types::LogStreamEventBridgeSinkRegionEnum }, optional: false, nullable: false, api_name: "awsRegion"
      field :aws_partner_event_source, -> { String }, optional: true, nullable: false, api_name: "awsPartnerEventSource"
    end
  end
end
