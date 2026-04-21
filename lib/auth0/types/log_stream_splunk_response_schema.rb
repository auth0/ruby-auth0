# frozen_string_literal: true

module Auth0
  module Types
    class LogStreamSplunkResponseSchema < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :status, -> { Auth0::Types::LogStreamStatusEnum }, optional: true, nullable: false
      field :type, -> { Auth0::Types::LogStreamSplunkEnum }, optional: true, nullable: false
      field :is_priority, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "isPriority"
      field :filters, -> { Internal::Types::Array[Auth0::Types::LogStreamFilter] }, optional: true, nullable: false
      field :pii_config, -> { Auth0::Types::LogStreamPiiConfig }, optional: true, nullable: false
      field :sink, -> { Auth0::Types::LogStreamSplunkSink }, optional: true, nullable: false
    end
  end
end
