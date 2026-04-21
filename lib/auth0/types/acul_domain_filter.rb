# frozen_string_literal: true

module Auth0
  module Types
    # Domains array filter items
    class AculDomainFilter < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::AculDomainFilterByID }
      member -> { Auth0::Types::AculDomainFilterByMetadata }
    end
  end
end
