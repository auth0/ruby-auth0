# frozen_string_literal: true

module Auth0
  module Types
    class FormEndingNodeAfterSubmit < Internal::Types::Model
      field :flow_id, -> { String }, optional: true, nullable: false
    end
  end
end
