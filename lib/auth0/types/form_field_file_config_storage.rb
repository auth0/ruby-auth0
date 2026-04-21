# frozen_string_literal: true

module Auth0
  module Types
    class FormFieldFileConfigStorage < Internal::Types::Model
      field :type, -> { Auth0::Types::FormFieldFileConfigStorageTypeEnum }, optional: false, nullable: false
    end
  end
end
