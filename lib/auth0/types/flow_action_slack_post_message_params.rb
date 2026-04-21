# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionSlackPostMessageParams < Internal::Types::Model
      field :connection_id, -> { String }, optional: false, nullable: false
      field :text, -> { String }, optional: true, nullable: false
      field :attachments, -> { Internal::Types::Array[Auth0::Types::FlowActionSlackPostMessageParamsAttachment] }, optional: true, nullable: false
    end
  end
end
