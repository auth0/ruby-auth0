# frozen_string_literal: true

module Auth0
  module Types
    class CreateVerificationEmailResponseContent < Internal::Types::Model
      field :status, -> { String }, optional: false, nullable: false
      field :type, -> { String }, optional: false, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :id, -> { String }, optional: false, nullable: false
    end
  end
end
