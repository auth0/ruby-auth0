# frozen_string_literal: true

module Auth0
  module Types
    class SignupSchema < Internal::Types::Model
      field :status, -> { Auth0::Types::SignupStatusEnum }, optional: true, nullable: false
    end
  end
end
