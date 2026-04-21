# frozen_string_literal: true

module Auth0
  module Types
    class ResourceServerTokenEncryption < Internal::Types::Model
      field :format, -> { Auth0::Types::ResourceServerTokenEncryptionFormatEnum }, optional: false, nullable: false
      field :encryption_key, -> { Auth0::Types::ResourceServerTokenEncryptionKey }, optional: false, nullable: false
    end
  end
end
