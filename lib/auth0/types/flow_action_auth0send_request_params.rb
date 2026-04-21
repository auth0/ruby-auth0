# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionAuth0SendRequestParams < Internal::Types::Model
      field :connection_id, -> { String }, optional: false, nullable: false
      field :pathname, -> { String }, optional: false, nullable: false
      field :method_, -> { Auth0::Types::FlowActionAuth0SendRequestParamsMethod }, optional: true, nullable: false, api_name: "method"
      field :headers, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :params, -> { Internal::Types::Hash[String, Auth0::Types::FlowActionAuth0SendRequestParamsQueryParamsValue] }, optional: true, nullable: false
      field :payload, -> { Auth0::Types::FlowActionAuth0SendRequestParamsPayload }, optional: true, nullable: false
    end
  end
end
