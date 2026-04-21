# frozen_string_literal: true

module Auth0
  module Types
    # Organizations array filter items
    class AculOrganizationFilter < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::AculOrganizationFilterByID }
      member -> { Auth0::Types::AculOrganizationFilterByMetadata }
    end
  end
end
