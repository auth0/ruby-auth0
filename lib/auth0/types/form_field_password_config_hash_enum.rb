# frozen_string_literal: true

module Auth0
  module Types
    module FormFieldPasswordConfigHashEnum
      extend Auth0::Internal::Types::Enum

      NONE = "NONE"
      MD5 = "MD5"
      SHA1 = "SHA1"
      SHA256 = "SHA256"
      SHA512 = "SHA512"
    end
  end
end
