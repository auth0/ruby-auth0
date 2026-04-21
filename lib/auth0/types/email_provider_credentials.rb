# frozen_string_literal: true

module Auth0
  module Types
    # Credentials required to use the provider.
    class EmailProviderCredentials < Internal::Types::Model
      field :api_user, -> { String }, optional: true, nullable: false
      field :region, -> { String }, optional: true, nullable: false
      field :smtp_host, -> { String }, optional: true, nullable: false
      field :smtp_port, -> { Integer }, optional: true, nullable: false
      field :smtp_user, -> { String }, optional: true, nullable: false
    end
  end
end
