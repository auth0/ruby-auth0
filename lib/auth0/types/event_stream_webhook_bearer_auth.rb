# frozen_string_literal: true

module Auth0
  module Types
    # Bearer Authorization for HTTP requests (e.g., 'Bearer token').
    class EventStreamWebhookBearerAuth < Internal::Types::Model
      field :method_, -> { Auth0::Types::EventStreamWebhookBearerAuthMethodEnum }, optional: false, nullable: false, api_name: "method"
    end
  end
end
