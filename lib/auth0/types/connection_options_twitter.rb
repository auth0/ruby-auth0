# frozen_string_literal: true

module Auth0
  module Types
    # Options for the 'twitter' connection
    class ConnectionOptionsTwitter < Internal::Types::Model
      field :client_id, -> { String }, optional: true, nullable: false
      field :client_secret, -> { String }, optional: true, nullable: false
      field :freeform_scopes, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :protocol, -> { Auth0::Types::ConnectionOptionsProtocolEnumTwitter }, optional: true, nullable: false
      field :scope, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :set_user_root_attributes, -> { Auth0::Types::ConnectionSetUserRootAttributesEnum }, optional: true, nullable: false
      field :upstream_params, -> { Internal::Types::Hash[String, Auth0::Types::ConnectionUpstreamAdditionalProperties] }, optional: true, nullable: false
      field :offline_access, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :profile, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :tweet_read, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :users_read, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
