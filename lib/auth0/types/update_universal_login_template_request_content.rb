# frozen_string_literal: true

module Auth0
  module Types
    class UpdateUniversalLoginTemplateRequestContent < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { String }
      member -> { Auth0::Types::UpdateUniversalLoginTemplateRequestContentTemplate }
    end
  end
end
