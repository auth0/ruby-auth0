# frozen_string_literal: true

module Auth0
  module Types
    # Sentry SSO configuration.
    class ClientAddonSentry < Internal::Types::Model
      field :org_slug, -> { String }, optional: true, nullable: false
      field :base_url, -> { String }, optional: true, nullable: false
    end
  end
end
