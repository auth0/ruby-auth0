# frozen_string_literal: true

module Auth0
  module Organizations
    module Clients
      module Types
        class UpdateOrganizationClientRequestContent < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false

          field :client_id, -> { String }, optional: false, nullable: false

          field :use_for_member_access, -> { Internal::Types::Boolean }, optional: true, nullable: false
        end
      end
    end
  end
end
