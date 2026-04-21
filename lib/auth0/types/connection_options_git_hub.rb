# frozen_string_literal: true

module Auth0
  module Types
    # Options for the 'github' connection
    class ConnectionOptionsGitHub < Internal::Types::Model
      field :client_id, -> { String }, optional: true, nullable: false
      field :client_secret, -> { String }, optional: true, nullable: false
      field :freeform_scopes, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :scope, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :set_user_root_attributes, -> { Auth0::Types::ConnectionSetUserRootAttributesEnum }, optional: true, nullable: false
      field :upstream_params, -> { Internal::Types::Hash[String, Auth0::Types::ConnectionUpstreamAdditionalProperties] }, optional: true, nullable: false
      field :admin_org, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :admin_public_key, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :admin_repo_hook, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :delete_repo, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :email, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :follow, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :gist, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :notifications, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :profile, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :public_repo, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :read_org, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :read_public_key, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :read_repo_hook, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :read_user, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :repo, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :repo_deployment, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :repo_status, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :write_org, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :write_public_key, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :write_repo_hook, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
