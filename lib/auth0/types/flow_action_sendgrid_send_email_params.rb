# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionSendgridSendEmailParams < Internal::Types::Model
      field :connection_id, -> { String }, optional: false, nullable: false
      field :from, -> { Auth0::Types::FlowActionSendgridSendEmailParamsPerson }, optional: false, nullable: false
      field :personalizations, -> { Internal::Types::Array[Object] }, optional: false, nullable: false
    end
  end
end
