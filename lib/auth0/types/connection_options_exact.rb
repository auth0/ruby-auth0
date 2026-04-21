# frozen_string_literal: true

module Auth0
  module Types
    # Options for the 'exact' connection
    class ConnectionOptionsExact < Internal::Types::Model
      field :base_url, -> { String }, optional: true, nullable: false, api_name: "baseUrl"
      field :client_id, -> { String }, optional: true, nullable: false
      field :client_secret, -> { String }, optional: true, nullable: false
      field :profile, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :set_user_root_attributes, -> { Auth0::Types::ConnectionSetUserRootAttributesEnum }, optional: true, nullable: false
      field :upstream_params, -> { Internal::Types::Hash[String, Auth0::Types::ConnectionUpstreamAdditionalProperties] }, optional: true, nullable: false
    end
  end
end
