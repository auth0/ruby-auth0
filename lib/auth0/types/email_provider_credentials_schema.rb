# frozen_string_literal: true

module Auth0
  module Types
    # Credentials required to use the provider.
    class EmailProviderCredentialsSchema < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EmailProviderCredentialsSchemaZero }
      member -> { Auth0::Types::EmailProviderCredentialsSchemaAccessKeyID }
      member -> { Auth0::Types::EmailProviderCredentialsSchemaSMTPHost }
      member -> { Auth0::Types::EmailProviderCredentialsSchemaThree }
      member -> { Auth0::Types::EmailProviderCredentialsSchemaAPIKey }
      member -> { Auth0::Types::EmailProviderCredentialsSchemaConnectionString }
      member -> { Auth0::Types::EmailProviderCredentialsSchemaClientID }
      member -> { Auth0::Types::ExtensibilityEmailProviderCredentials }
    end
  end
end
