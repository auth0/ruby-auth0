# frozen_string_literal: true

module Auth0
  module Types
    # Identity object when accounts are linked.
    class EventStreamCloudEventUserDeletedPreviousObjectIdentitiesItem < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamCloudEventUserDeletedPreviousObjectIdentitiesItemCustom }

      member -> { Auth0::Types::EventStreamCloudEventUserDeletedPreviousObjectIdentitiesItemDatabase }

      member -> { Auth0::Types::EventStreamCloudEventUserDeletedPreviousObjectIdentitiesItemEnterprise }

      member -> { Auth0::Types::EventStreamCloudEventUserDeletedPreviousObjectIdentitiesItemPasswordless }

      member -> { Auth0::Types::EventStreamCloudEventUserDeletedPreviousObjectIdentitiesItemSocial }
    end
  end
end
