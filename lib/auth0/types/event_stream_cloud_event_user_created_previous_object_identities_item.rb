# frozen_string_literal: true

module Auth0
  module Types
    # Identity object when accounts are linked.
    class EventStreamCloudEventUserCreatedPreviousObjectIdentitiesItem < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamCloudEventUserCreatedPreviousObjectIdentitiesItemCustom }

      member -> { Auth0::Types::EventStreamCloudEventUserCreatedPreviousObjectIdentitiesItemDatabase }

      member -> { Auth0::Types::EventStreamCloudEventUserCreatedPreviousObjectIdentitiesItemEnterprise }

      member -> { Auth0::Types::EventStreamCloudEventUserCreatedPreviousObjectIdentitiesItemPasswordless }

      member -> { Auth0::Types::EventStreamCloudEventUserCreatedPreviousObjectIdentitiesItemSocial }
    end
  end
end
