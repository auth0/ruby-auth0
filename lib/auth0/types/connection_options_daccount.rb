# frozen_string_literal: true

module Auth0
  module Types
    # Options for the 'daccount' connection
    class ConnectionOptionsDaccount < Internal::Types::Model
      field :client_id, -> { String }, optional: true, nullable: false

      field :client_secret, -> { String }, optional: true, nullable: false

      field :scope, -> { Auth0::Types::ConnectionScopeOAuth2 }, optional: true, nullable: false

      field :set_user_root_attributes, -> { Auth0::Types::ConnectionSetUserRootAttributesEnum }, optional: true, nullable: false

      field :upstream_params, -> { Internal::Types::Hash[String, Auth0::Types::ConnectionUpstreamAdditionalProperties] }, optional: true, nullable: false

      field :non_persistent_attrs, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
