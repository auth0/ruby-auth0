# frozen_string_literal: true

module Auth0
  module Types
    class GetEmailFactorSettingsResponseContent < Internal::Types::Model
      field :otp_length, -> { Integer }, optional: false, nullable: false

      field :otp_expiration_time, -> { Integer }, optional: false, nullable: false
    end
  end
end
