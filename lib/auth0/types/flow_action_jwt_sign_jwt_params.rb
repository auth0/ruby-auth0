# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionJwtSignJwtParams < Internal::Types::Model
      field :connection_id, -> { String }, optional: false, nullable: false
      field :payload, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :subject, -> { String }, optional: true, nullable: false
      field :issuer, -> { String }, optional: true, nullable: false
      field :audience, -> { String }, optional: true, nullable: false
      field :expires_in, -> { String }, optional: true, nullable: false
    end
  end
end
