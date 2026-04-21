# frozen_string_literal: true

module Auth0
  module Types
    class FormBlock < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::FormBlockDivider }
      member -> { Auth0::Types::FormBlockHTML }
      member -> { Auth0::Types::FormBlockImage }
      member -> { Auth0::Types::FormBlockJumpButton }
      member -> { Auth0::Types::FormBlockResendButton }
      member -> { Auth0::Types::FormBlockNextButton }
      member -> { Auth0::Types::FormBlockPreviousButton }
      member -> { Auth0::Types::FormBlockRichText }
    end
  end
end
