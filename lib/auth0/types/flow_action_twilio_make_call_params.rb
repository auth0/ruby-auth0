# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionTwilioMakeCallParams < Internal::Types::Model
      field :connection_id, -> { String }, optional: false, nullable: false
      field :from, -> { String }, optional: false, nullable: false
      field :to, -> { String }, optional: false, nullable: false
      field :payload, -> { String }, optional: false, nullable: false
    end
  end
end
