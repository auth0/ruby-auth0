# frozen_string_literal: true

module Auth0
  module Types
    class FormFieldFileConfig < Internal::Types::Model
      field :multiple, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :storage, -> { Auth0::Types::FormFieldFileConfigStorage }, optional: true, nullable: false
      field :categories, -> { Internal::Types::Array[Auth0::Types::FormFieldFileConfigCategoryEnum] }, optional: true, nullable: false
      field :extensions, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :max_size, -> { Integer }, optional: true, nullable: false, api_name: "maxSize"
      field :max_files, -> { Integer }, optional: true, nullable: false, api_name: "maxFiles"
    end
  end
end
