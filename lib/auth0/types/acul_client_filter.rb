# frozen_string_literal: true

module Auth0
  module Types
    # Client array filter items
    class AculClientFilter < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::AculClientFilterByID }
      member -> { Auth0::Types::AculClientFilterByMetadata }
    end
  end
end
