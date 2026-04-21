# frozen_string_literal: true

module Auth0
  module Types
    class FormNode < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::FormFlow }
      member -> { Auth0::Types::FormRouter }
      member -> { Auth0::Types::FormStep }
    end
  end
end
