# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionTelegramSendMessageParams < Internal::Types::Model
      field :connection_id, -> { String }, optional: false, nullable: false
      field :chat_id, -> { String }, optional: false, nullable: false
      field :text, -> { String }, optional: false, nullable: false
    end
  end
end
