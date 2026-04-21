# frozen_string_literal: true

module Auth0
  module Types
    # Encryption key
    class CreateEncryptionKeyResponseContent < Internal::Types::Model
      field :kid, -> { String }, optional: false, nullable: false
      field :type, -> { Auth0::Types::EncryptionKeyType }, optional: false, nullable: false
      field :state, -> { Auth0::Types::EncryptionKeyState }, optional: false, nullable: false
      field :created_at, -> { String }, optional: false, nullable: false
      field :updated_at, -> { String }, optional: false, nullable: false
      field :parent_kid, -> { String }, optional: true, nullable: false
      field :public_key, -> { String }, optional: true, nullable: false
    end
  end
end
