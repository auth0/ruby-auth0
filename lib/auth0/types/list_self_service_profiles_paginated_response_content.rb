# frozen_string_literal: true

module Auth0
  module Types
    class ListSelfServiceProfilesPaginatedResponseContent < Internal::Types::Model
      field :start, -> { Integer }, optional: true, nullable: false
      field :limit, -> { Integer }, optional: true, nullable: false
      field :total, -> { Integer }, optional: true, nullable: false
      field :self_service_profiles, -> { Internal::Types::Array[Auth0::Types::SelfServiceProfile] }, optional: true, nullable: false
    end
  end
end
