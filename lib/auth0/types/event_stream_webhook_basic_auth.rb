# frozen_string_literal: true

module Auth0
  module Types
    # Basic Authorization for HTTP requests (e.g., 'Basic credentials').
    class EventStreamWebhookBasicAuth < Internal::Types::Model
      field :method_, -> { Auth0::Types::EventStreamWebhookBasicAuthMethodEnum }, optional: false, nullable: false, api_name: "method"
      field :username, -> { String }, optional: false, nullable: false
    end
  end
end
