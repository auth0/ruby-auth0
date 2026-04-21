# frozen_string_literal: true

module Auth0
  module Types
    class UsersEnrollment < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :status, -> { Auth0::Types::UserEnrollmentStatusEnum }, optional: true, nullable: false
      field :type, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :identifier, -> { String }, optional: true, nullable: false
      field :phone_number, -> { String }, optional: true, nullable: false
      field :auth_method, -> { Auth0::Types::UserEnrollmentAuthMethodEnum }, optional: true, nullable: false
      field :enrolled_at, -> { String }, optional: true, nullable: false
      field :last_auth, -> { String }, optional: true, nullable: false
    end
  end
end
