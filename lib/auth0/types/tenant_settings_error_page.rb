# frozen_string_literal: true

module Auth0
  module Types
    # Error page customization.
    class TenantSettingsErrorPage < Internal::Types::Model
      field :html, -> { String }, optional: true, nullable: false
      field :show_log_link, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :url, -> { String }, optional: true, nullable: false
    end
  end
end
