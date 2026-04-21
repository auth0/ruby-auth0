# frozen_string_literal: true

module Auth0
  module Types
    class FormBlockImageConfig < Internal::Types::Model
      field :src, -> { String }, optional: false, nullable: false
      field :position, -> { Auth0::Types::FormBlockImageConfigPositionEnum }, optional: true, nullable: false
      field :height, -> { Integer }, optional: true, nullable: false
    end
  end
end
