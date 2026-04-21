# frozen_string_literal: true

module Auth0
  module Types
    class FlowsVaultConnectionHTTPOauthClientCredentialsSetup < Internal::Types::Model
      field :type, -> { Auth0::Types::FlowsVaultConnectionSetupTypeOauthClientCredentialsEnum }, optional: false, nullable: false
      field :client_id, -> { String }, optional: false, nullable: false
      field :client_secret, -> { String }, optional: false, nullable: false
      field :token_endpoint, -> { String }, optional: false, nullable: false
      field :audience, -> { String }, optional: true, nullable: false
      field :resource, -> { String }, optional: true, nullable: false
      field :scope, -> { String }, optional: true, nullable: false
    end
  end
end
