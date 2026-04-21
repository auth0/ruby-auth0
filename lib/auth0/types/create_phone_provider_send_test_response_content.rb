# frozen_string_literal: true

module Auth0
  module Types
    class CreatePhoneProviderSendTestResponseContent < Internal::Types::Model
      field :code, -> { Integer }, optional: true, nullable: false
      field :message, -> { String }, optional: true, nullable: false
    end
  end
end
