# frozen_string_literal: true

module Auth0
  module Types
    class LogStreamHTTPSink < Internal::Types::Model
      field :http_authorization, -> { String }, optional: true, nullable: false, api_name: "httpAuthorization"
      field :http_content_format, -> { Auth0::Types::LogStreamHTTPContentFormatEnum }, optional: true, nullable: false, api_name: "httpContentFormat"
      field :http_content_type, -> { String }, optional: true, nullable: false, api_name: "httpContentType"
      field :http_endpoint, -> { String }, optional: false, nullable: false, api_name: "httpEndpoint"
      field :http_custom_headers, -> { Internal::Types::Array[Auth0::Types::HTTPCustomHeader] }, optional: true, nullable: false, api_name: "httpCustomHeaders"
    end
  end
end
