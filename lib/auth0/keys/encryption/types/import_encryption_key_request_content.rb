# frozen_string_literal: true

module Auth0
  module Keys
    module Encryption
      module Types
        class ImportEncryptionKeyRequestContent < Internal::Types::Model
          field :kid, -> { String }, optional: false, nullable: false
          field :wrapped_key, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
