# frozen_string_literal: true

module Auth0
  module Types
    # Custom header authorization for HTTP requests.
    class EventStreamWebhookCustomHeaderAuth < Internal::Types::Model
      field :method_, -> { Auth0::Types::EventStreamWebhookCustomHeaderAuthMethodEnum }, optional: false, nullable: false, api_name: "method"
      field :header_key, -> { String }, optional: false, nullable: false
    end
  end
end
