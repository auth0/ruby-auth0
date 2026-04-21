# frozen_string_literal: true

module Auth0
  module Types
    class EmailProviderCredentialsSchemaSMTPHost < Internal::Types::Model
      field :smtp_host, -> { String }, optional: true, nullable: false
      field :smtp_port, -> { Integer }, optional: true, nullable: false
      field :smtp_user, -> { String }, optional: true, nullable: false
      field :smtp_pass, -> { String }, optional: true, nullable: false
    end
  end
end
