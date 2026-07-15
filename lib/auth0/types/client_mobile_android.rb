# frozen_string_literal: true

module Auth0
  module Types
    # Android native app configuration.
    class ClientMobileAndroid < Internal::Types::Model
      field :app_package_name, -> { String }, optional: true, nullable: false

      field :sha256_cert_fingerprints, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
