# frozen_string_literal: true

module Auth0
  module Types
    class UpdateDefaultDomainResponseContent < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::UpdateDefaultCustomDomainResponseContent }
      member -> { Auth0::Types::UpdateDefaultCanonicalDomainResponseContent }
    end
  end
end
