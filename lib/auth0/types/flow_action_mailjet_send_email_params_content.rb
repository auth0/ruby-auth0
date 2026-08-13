# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionMailjetSendEmailParamsContent < Internal::Types::Model
      field :content, -> { String }, optional: false, nullable: false
    end
  end
end
