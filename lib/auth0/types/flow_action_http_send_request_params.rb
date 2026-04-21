# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionHTTPSendRequestParams < Internal::Types::Model
      field :connection_id, -> { String }, optional: true, nullable: false
      field :url, -> { String }, optional: false, nullable: false
      field :method_, -> { Auth0::Types::FlowActionHTTPSendRequestParamsMethod }, optional: true, nullable: false, api_name: "method"
      field :headers, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :basic, -> { Auth0::Types::FlowActionHTTPSendRequestParamsBasicAuth }, optional: true, nullable: false
      field :params, -> { Internal::Types::Hash[String, Auth0::Types::FlowActionHTTPSendRequestParamsQueryParamsValue] }, optional: true, nullable: false
      field :payload, -> { Auth0::Types::FlowActionHTTPSendRequestParamsPayload }, optional: true, nullable: false
      field :content_type, -> { Auth0::Types::FlowActionHTTPSendRequestParamsContentType }, optional: true, nullable: false
    end
  end
end
