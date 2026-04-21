# frozen_string_literal: true

module Auth0
  module Types
    class GetUniversalLoginTemplateResponseContent < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::GetUniversalLoginTemplate }
      member -> { String }
    end
  end
end
