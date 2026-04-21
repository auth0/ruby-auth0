# frozen_string_literal: true

module Auth0
  module Types
    class GetJobImportUserError < Internal::Types::Model
      field :code, -> { String }, optional: true, nullable: false
      field :message, -> { String }, optional: true, nullable: false
      field :path, -> { String }, optional: true, nullable: false
    end
  end
end
