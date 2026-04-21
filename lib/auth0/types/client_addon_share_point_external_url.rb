# frozen_string_literal: true

module Auth0
  module Types
    # External SharePoint application URLs if exposed to the Internet.
    class ClientAddonSharePointExternalURL < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Internal::Types::Array[String] }
      member -> { String }
    end
  end
end
