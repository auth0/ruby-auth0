# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionMailjetSendEmailParamsTemplateID < Internal::Types::Model
      field :template_id, -> { Integer }, optional: false, nullable: false
      field :variables, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end
