# frozen_string_literal: true

module Auth0
  module Types
    class FormField < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::FormFieldBoolean }
      member -> { Auth0::Types::FormFieldCards }
      member -> { Auth0::Types::FormFieldChoice }
      member -> { Auth0::Types::FormFieldCustom }
      member -> { Auth0::Types::FormFieldDate }
      member -> { Auth0::Types::FormFieldDropdown }
      member -> { Auth0::Types::FormFieldEmail }
      member -> { Auth0::Types::FormFieldFile }
      member -> { Auth0::Types::FormFieldLegal }
      member -> { Auth0::Types::FormFieldNumber }
      member -> { Auth0::Types::FormFieldPassword }
      member -> { Auth0::Types::FormFieldPayment }
      member -> { Auth0::Types::FormFieldSocial }
      member -> { Auth0::Types::FormFieldTel }
      member -> { Auth0::Types::FormFieldText }
      member -> { Auth0::Types::FormFieldURL }
    end
  end
end
