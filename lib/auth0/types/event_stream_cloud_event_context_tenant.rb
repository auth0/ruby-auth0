# frozen_string_literal: true

module Auth0
  module Types
    # Reference to a tenant in event context
    class EventStreamCloudEventContextTenant < Internal::Types::Model
      field :tenant_id, -> { String }, optional: false, nullable: false
    end
  end
end
