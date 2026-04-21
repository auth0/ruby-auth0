# frozen_string_literal: true

module Auth0
  module Types
    class MdlPresentationProperties < Internal::Types::Model
      field :family_name, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :given_name, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :birth_date, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :issue_date, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :expiry_date, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :issuing_country, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :issuing_authority, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :portrait, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :driving_privileges, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :resident_address, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :portrait_capture_date, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :age_in_years, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :age_birth_year, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :issuing_jurisdiction, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :nationality, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :resident_city, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :resident_state, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :resident_postal_code, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :resident_country, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :family_name_national_character, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :given_name_national_character, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
