# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=sms
    class UpdateConnectionRequestContentSms < Internal::Types::Model
      field :options, -> { Auth0::Types::ConnectionOptionsSms }, optional: true, nullable: false
    end
  end
end
