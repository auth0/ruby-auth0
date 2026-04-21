# frozen_string_literal: true

module Auth0
  module Types
    class FormComponent < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::FormBlock }
      member -> { Auth0::Types::FormWidget }
      member -> { Auth0::Types::FormField }
    end
  end
end
