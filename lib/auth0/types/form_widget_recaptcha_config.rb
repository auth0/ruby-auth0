# frozen_string_literal: true

module Auth0
  module Types
    class FormWidgetRecaptchaConfig < Internal::Types::Model
      field :site_key, -> { String }, optional: false, nullable: false
      field :secret_key, -> { String }, optional: false, nullable: false
    end
  end
end
