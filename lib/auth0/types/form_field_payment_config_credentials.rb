# frozen_string_literal: true

module Auth0
  module Types
    class FormFieldPaymentConfigCredentials < Internal::Types::Model
      field :public_key, -> { String }, optional: false, nullable: false
      field :private_key, -> { String }, optional: false, nullable: false
    end
  end
end
