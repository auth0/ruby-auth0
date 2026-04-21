# frozen_string_literal: true

module Auth0
  module Types
    class SignupVerified < Internal::Types::Model
      field :status, -> { Auth0::Types::SignupStatusEnum }, optional: true, nullable: false
      field :verification, -> { Auth0::Types::SignupVerification }, optional: true, nullable: false
    end
  end
end
