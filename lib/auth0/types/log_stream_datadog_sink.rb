# frozen_string_literal: true

module Auth0
  module Types
    class LogStreamDatadogSink < Internal::Types::Model
      field :datadog_api_key, -> { String }, optional: false, nullable: false, api_name: "datadogApiKey"
      field :datadog_region, -> { Auth0::Types::LogStreamDatadogRegionEnum }, optional: false, nullable: false, api_name: "datadogRegion"
    end
  end
end
