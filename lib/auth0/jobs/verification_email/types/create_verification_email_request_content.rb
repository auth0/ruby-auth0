# frozen_string_literal: true

module Auth0
  module Jobs
    module VerificationEmail
      module Types
        class CreateVerificationEmailRequestContent < Internal::Types::Model
          field :user_id, -> { String }, optional: false, nullable: false
          field :client_id, -> { String }, optional: true, nullable: false
          field :identity, -> { Auth0::Types::Identity }, optional: true, nullable: false
          field :organization_id, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
