# frozen_string_literal: true

module Auth0
  module Types
    class LogStreamSplunkSink < Internal::Types::Model
      field :splunk_domain, -> { String }, optional: false, nullable: false, api_name: "splunkDomain"
      field :splunk_port, -> { String }, optional: false, nullable: false, api_name: "splunkPort"
      field :splunk_token, -> { String }, optional: false, nullable: false, api_name: "splunkToken"
      field :splunk_secure, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "splunkSecure"
    end
  end
end
