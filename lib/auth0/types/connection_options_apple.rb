# frozen_string_literal: true

module Auth0
  module Types
    # Options for the 'apple' connection
    class ConnectionOptionsApple < Internal::Types::Model
      field :app_secret, -> { String }, optional: true, nullable: false
      field :client_id, -> { String }, optional: true, nullable: false
      field :email, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :freeform_scopes, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :kid, -> { String }, optional: true, nullable: false
      field :name, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :scope, -> { String }, optional: true, nullable: false
      field :set_user_root_attributes, -> { Auth0::Types::ConnectionSetUserRootAttributesEnum }, optional: true, nullable: false
      field :team_id, -> { String }, optional: true, nullable: false
      field :upstream_params, -> { Internal::Types::Hash[String, Auth0::Types::ConnectionUpstreamAdditionalProperties] }, optional: true, nullable: false
    end
  end
end
