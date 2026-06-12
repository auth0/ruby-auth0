# frozen_string_literal: true

module Auth0
  module Types
    # X-XSS-Protection header configuration (deprecated header, use CSP instead).
    class XSSProtectionConfig < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :mode, -> { Auth0::Types::XSSProtectionMode }, optional: true, nullable: false

      field :report_uri, -> { String }, optional: true, nullable: false
    end
  end
end
