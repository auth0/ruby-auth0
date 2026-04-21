# frozen_string_literal: true

module Auth0
  module Clients
    module Credentials
      module Types
        class PatchClientCredentialRequestContent < Internal::Types::Model
          field :client_id, -> { String }, optional: false, nullable: false
          field :credential_id, -> { String }, optional: false, nullable: false
          field :expires_at, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
