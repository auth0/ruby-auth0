# frozen_string_literal: true

module Auth0
  module Types
    class CreateLogStreamMixpanelRequestBody < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :type, -> { Auth0::Types::LogStreamMixpanelEnum }, optional: false, nullable: false
      field :is_priority, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "isPriority"
      field :filters, -> { Internal::Types::Array[Auth0::Types::LogStreamFilter] }, optional: true, nullable: false
      field :pii_config, -> { Auth0::Types::LogStreamPiiConfig }, optional: true, nullable: false
      field :sink, -> { Auth0::Types::LogStreamMixpanelSink }, optional: false, nullable: false
      field :start_from, -> { String }, optional: true, nullable: false, api_name: "startFrom"
    end
  end
end
