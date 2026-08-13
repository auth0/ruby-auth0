# frozen_string_literal: true

module Auth0
  module Types
    # Configuration for IdP-Initiated SAML Single Sign-On. When enabled, allows users to initiate login directly from
    # their SAML identity provider without first visiting Auth0. The IdP must include the connection parameter in the
    # post-back URL (Assertion Consumer Service URL).
    class EventStreamCloudEventConnectionUpdatedObject3OptionsIdpinitiated < Internal::Types::Model
      field :client_authorizequery, -> { String }, optional: true, nullable: false

      field :client_id, -> { String }, optional: true, nullable: false

      field :client_protocol, -> { Auth0::Types::EventStreamCloudEventConnectionUpdatedObject3OptionsIdpinitiatedClientProtocolEnum }, optional: true, nullable: false

      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
