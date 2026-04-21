# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=sms
    class ConnectionResponseContentSms < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentSmsStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsSms }, optional: true, nullable: false
    end
  end
end
