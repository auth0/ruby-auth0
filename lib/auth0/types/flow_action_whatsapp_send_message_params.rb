# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionWhatsappSendMessageParams < Internal::Types::Model
      field :connection_id, -> { String }, optional: false, nullable: false
      field :sender_id, -> { String }, optional: false, nullable: false
      field :recipient_number, -> { String }, optional: false, nullable: false
      field :type, -> { Auth0::Types::FlowActionWhatsappSendMessageParamsType }, optional: false, nullable: false
      field :payload, -> { Auth0::Types::FlowActionWhatsappSendMessageParamsPayload }, optional: false, nullable: false
    end
  end
end
