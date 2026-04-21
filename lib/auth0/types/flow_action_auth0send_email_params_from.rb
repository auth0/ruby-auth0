# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionAuth0SendEmailParamsFrom < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :email, -> { String }, optional: false, nullable: false
    end
  end
end
