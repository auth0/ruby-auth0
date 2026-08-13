# frozen_string_literal: true

module Auth0
  module Internal
    module Types
      module Unknown
        include Auth0::Internal::Types::Type

        def coerce(value)
          value
        end
      end
    end
  end
end
