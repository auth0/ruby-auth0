# frozen_string_literal: true

module Auth0
  module Types
    class FormWidget < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::FormWidgetAuth0VerifiableCredentials }
      member -> { Auth0::Types::FormWidgetGMapsAddress }
      member -> { Auth0::Types::FormWidgetRecaptcha }
    end
  end
end
