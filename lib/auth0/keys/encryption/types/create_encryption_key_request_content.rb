# frozen_string_literal: true

module Auth0
  module Keys
    module Encryption
      module Types
        class CreateEncryptionKeyRequestContent < Internal::Types::Model
          field :type, -> { Auth0::Types::CreateEncryptionKeyType }, optional: false, nullable: false
        end
      end
    end
  end
end
