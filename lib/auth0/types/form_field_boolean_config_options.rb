# frozen_string_literal: true

module Auth0
  module Types
    class FormFieldBooleanConfigOptions < Internal::Types::Model
      field :true_, -> { String }, optional: true, nullable: false, api_name: "true"
      field :false_, -> { String }, optional: true, nullable: false, api_name: "false"
    end
  end
end
