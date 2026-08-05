# frozen_string_literal: true

module Auth0
  module Types
    class GetOrganizationClientResponseContent < Internal::Types::Model
      field :client_id, -> { String }, optional: false, nullable: false

      field :use_for_member_access, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :client, -> { Auth0::Types::OrganizationClientMetadata }, optional: false, nullable: false
    end
  end
end
