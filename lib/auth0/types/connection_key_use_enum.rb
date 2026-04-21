# frozen_string_literal: true

module Auth0
  module Types
    module ConnectionKeyUseEnum
      extend Auth0::Internal::Types::Enum

      ENCRYPTION = "encryption"
      SIGNING = "signing"
    end
  end
end
