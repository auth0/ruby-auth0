# frozen_string_literal: true

module Auth0
  module Types
    class GetGuardianEnrollmentResponseContent < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :status, -> { Auth0::Types::GuardianEnrollmentStatus }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :identifier, -> { String }, optional: true, nullable: false
      field :phone_number, -> { String }, optional: true, nullable: false
      field :enrolled_at, -> { String }, optional: true, nullable: false
      field :last_auth, -> { String }, optional: true, nullable: false
    end
  end
end
