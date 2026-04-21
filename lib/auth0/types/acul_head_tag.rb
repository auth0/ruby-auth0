# frozen_string_literal: true

module Auth0
  module Types
    class AculHeadTag < Internal::Types::Model
      field :tag, -> { String }, optional: true, nullable: false
      field :attributes, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :content, -> { String }, optional: true, nullable: false
    end
  end
end
