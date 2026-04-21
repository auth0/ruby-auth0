# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionSlackPostMessageParamsAttachmentField < Internal::Types::Model
      field :title, -> { String }, optional: false, nullable: false
      field :value, -> { String }, optional: true, nullable: false
      field :short, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
