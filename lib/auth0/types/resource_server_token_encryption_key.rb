# frozen_string_literal: true

module Auth0
  module Types
    class ResourceServerTokenEncryptionKey < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :alg, -> { Auth0::Types::ResourceServerTokenEncryptionAlgorithmEnum }, optional: false, nullable: false
      field :kid, -> { String }, optional: true, nullable: false
      field :pem, -> { String }, optional: false, nullable: false
    end
  end
end
