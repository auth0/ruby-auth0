# frozen_string_literal: true

module Auth0
  module VerifiableCredentials
    module Verification
      module Templates
        module Types
          class ListVerifiableCredentialTemplatesRequestParameters < Internal::Types::Model
            field :from, -> { String }, optional: true, nullable: false
            field :take, -> { Integer }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
