# frozen_string_literal: true

module Auth0
  module Types
    class ListActionVersionsPaginatedResponseContent < Internal::Types::Model
      field :total, -> { Integer }, optional: true, nullable: false
      field :page, -> { Integer }, optional: true, nullable: false
      field :per_page, -> { Integer }, optional: true, nullable: false
      field :versions, -> { Internal::Types::Array[Auth0::Types::ActionVersion] }, optional: true, nullable: false
    end
  end
end
