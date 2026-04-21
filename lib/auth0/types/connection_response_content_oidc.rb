# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=oidc
    class ConnectionResponseContentOidc < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentOidcStrategy }, optional: false, nullable: false
      field :authentication, -> { Auth0::Types::ConnectionAuthenticationPurpose }, optional: true, nullable: false
      field :connected_accounts, -> { Auth0::Types::ConnectionConnectedAccountsPurposeXaa }, optional: true, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsOidc }, optional: true, nullable: false
      field :show_as_button, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
