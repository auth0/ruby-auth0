# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionMailjetSendEmailParams < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::FlowActionMailjetSendEmailParamsContent }
      member -> { Auth0::Types::FlowActionMailjetSendEmailParamsTemplateID }
    end
  end
end
