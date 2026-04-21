# frozen_string_literal: true

module Auth0
  module Types
    class FlowsVaultConnectioSetupBigqueryOauthJwt < Internal::Types::Model
      field :type, -> { Auth0::Types::FlowsVaultConnectioSetupTypeOauthJwtEnum }, optional: true, nullable: false
      field :project_id, -> { String }, optional: true, nullable: false
      field :private_key, -> { String }, optional: true, nullable: false
      field :client_email, -> { String }, optional: true, nullable: false
    end
  end
end
