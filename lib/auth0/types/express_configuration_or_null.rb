# frozen_string_literal: true

module Auth0
  module Types
    # Application specific configuration for use with the OIN Express Configuration feature.
    class ExpressConfigurationOrNull < Internal::Types::Model
      field :initiate_login_uri_template, -> { String }, optional: false, nullable: false
      field :user_attribute_profile_id, -> { String }, optional: false, nullable: false
      field :connection_profile_id, -> { String }, optional: false, nullable: false
      field :enable_client, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :enable_organization, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :linked_clients, -> { Internal::Types::Array[Auth0::Types::LinkedClientConfiguration] }, optional: true, nullable: false
      field :okta_oin_client_id, -> { String }, optional: false, nullable: false
      field :admin_login_domain, -> { String }, optional: false, nullable: false
      field :oin_submission_id, -> { String }, optional: true, nullable: false
    end
  end
end
