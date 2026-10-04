# frozen_string_literal: true

module Auth0
  module Types
    # Identity object when accounts are linked.
    class EventStreamCloudEventUserUpdatedPreviousObjectIdentitiesItem < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamCloudEventUserUpdatedPreviousObjectIdentitiesItemCustom }

      member -> { Auth0::Types::EventStreamCloudEventUserUpdatedPreviousObjectIdentitiesItemDatabase }

      member -> { Auth0::Types::EventStreamCloudEventUserUpdatedPreviousObjectIdentitiesItemEnterprise }

      member -> { Auth0::Types::EventStreamCloudEventUserUpdatedPreviousObjectIdentitiesItemPasswordless }

      member -> { Auth0::Types::EventStreamCloudEventUserUpdatedPreviousObjectIdentitiesItemSocial }
    end
  end
end
