# frozen_string_literal: true

module Auth0
  module Types
    class LogStreamPiiConfig < Internal::Types::Model
      field :log_fields, -> { Internal::Types::Array[Auth0::Types::LogStreamPiiLogFieldsEnum] }, optional: false, nullable: false
      field :method_, -> { Auth0::Types::LogStreamPiiMethodEnum }, optional: true, nullable: false, api_name: "method"
      field :algorithm, -> { Auth0::Types::LogStreamPiiAlgorithmEnum }, optional: true, nullable: false
    end
  end
end
