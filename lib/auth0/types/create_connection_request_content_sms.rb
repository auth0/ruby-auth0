# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=sms
    class CreateConnectionRequestContentSms < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentSmsStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsSms }, optional: true, nullable: false
    end
  end
end
