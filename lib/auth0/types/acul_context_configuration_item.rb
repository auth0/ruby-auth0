# frozen_string_literal: true

module Auth0
  module Types
    class AculContextConfigurationItem < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::AculContextEnum }
      member -> { String }
    end
  end
end
