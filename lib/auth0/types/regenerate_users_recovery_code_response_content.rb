# frozen_string_literal: true

module Auth0
  module Types
    class RegenerateUsersRecoveryCodeResponseContent < Internal::Types::Model
      field :recovery_code, -> { String }, optional: true, nullable: false
    end
  end
end
