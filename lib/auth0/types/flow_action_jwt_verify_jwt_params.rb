# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionJwtVerifyJwtParams < Internal::Types::Model
      field :connection_id, -> { String }, optional: false, nullable: false
      field :token, -> { String }, optional: false, nullable: false
      field :audience, -> { String }, optional: true, nullable: false
      field :issuer, -> { String }, optional: true, nullable: false
    end
  end
end
