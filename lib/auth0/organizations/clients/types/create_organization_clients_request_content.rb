# frozen_string_literal: true

module Auth0
  module Organizations
    module Clients
      module Types
        class CreateOrganizationClientsRequestContent < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false

          field :clients, -> { Internal::Types::Array[Auth0::Types::CreateOrganizationClientRequestItem] }, optional: false, nullable: false
        end
      end
    end
  end
end
