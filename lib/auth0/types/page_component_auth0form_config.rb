# frozen_string_literal: true

module Auth0
  module Types
    class PageComponentAuth0FormConfig < Internal::Types::Model
      field :form_id, -> { String }, optional: false, nullable: false

      field :completion_message, -> { String }, optional: false, nullable: false
    end
  end
end
