# frozen_string_literal: true

module Auth0
  module Types
    class UpdateOrganizationClientResponseContent < Internal::Types::Model
      field :client_id, -> { String }, optional: false, nullable: false

      field :use_for_member_access, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :client, -> { Auth0::Types::OrganizationClientMetadata }, optional: true, nullable: false
    end
  end
end
