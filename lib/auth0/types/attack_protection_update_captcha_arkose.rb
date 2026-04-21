# frozen_string_literal: true

module Auth0
  module Types
    class AttackProtectionUpdateCaptchaArkose < Internal::Types::Model
      field :site_key, -> { String }, optional: false, nullable: false
      field :secret, -> { String }, optional: false, nullable: false
      field :client_subdomain, -> { String }, optional: true, nullable: false
      field :verify_subdomain, -> { String }, optional: true, nullable: false
      field :fail_open, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
