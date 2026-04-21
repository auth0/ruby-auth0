# frozen_string_literal: true

module Auth0
  module Types
    # Slack team or workspace name usually first segment in your Slack URL. e.g. `https://acme-org.slack.com` would be
    # `acme-org`.
    class ClientAddonSlack < Internal::Types::Model
      field :team, -> { String }, optional: false, nullable: false
    end
  end
end
