# frozen_string_literal: true

module Auth0
  module Types
    # Identity object when accounts are linked.
    class EventStreamCloudEventUserUpdatedObjectIdentitiesItem < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamCloudEventUserUpdatedObjectIdentitiesItemCustom }
      member -> { Auth0::Types::EventStreamCloudEventUserUpdatedObjectIdentitiesItemDatabase }
      member -> { Auth0::Types::EventStreamCloudEventUserUpdatedObjectIdentitiesItemEnterprise }
      member -> { Auth0::Types::EventStreamCloudEventUserUpdatedObjectIdentitiesItemPasswordless }
      member -> { Auth0::Types::EventStreamCloudEventUserUpdatedObjectIdentitiesItemSocial }
    end
  end
end
