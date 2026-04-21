# frozen_string_literal: true

module Auth0
  module Guardian
    module Enrollments
      module Types
        class CreateGuardianEnrollmentTicketRequestContent < Internal::Types::Model
          field :user_id, -> { String }, optional: false, nullable: false
          field :email, -> { String }, optional: true, nullable: false
          field :send_mail, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :email_locale, -> { String }, optional: true, nullable: false
          field :factor, -> { Auth0::Types::GuardianEnrollmentFactorEnum }, optional: true, nullable: false
          field :allow_multiple_enrollments, -> { Internal::Types::Boolean }, optional: true, nullable: false
        end
      end
    end
  end
end
