# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionSlackPostMessageParamsAttachment < Internal::Types::Model
      field :color, -> { Auth0::Types::FlowActionSlackPostMessageParamsAttachmentColor }, optional: true, nullable: false
      field :pretext, -> { String }, optional: true, nullable: false
      field :text, -> { String }, optional: true, nullable: false
      field :fields, -> { Internal::Types::Array[Auth0::Types::FlowActionSlackPostMessageParamsAttachmentField] }, optional: true, nullable: false
    end
  end
end
