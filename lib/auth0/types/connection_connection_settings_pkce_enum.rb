# frozen_string_literal: true

module Auth0
  module Types
    module ConnectionConnectionSettingsPkceEnum
      extend Auth0::Internal::Types::Enum

      AUTO = "auto"
      S256 = "S256"
      PLAIN = "plain"
      DISABLED = "disabled"
    end
  end
end
