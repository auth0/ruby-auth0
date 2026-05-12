# frozen_string_literal: true

module Auth0
  module Types
    # Identity object when accounts are linked.
    class EventStreamCloudEventUserDeletedObjectIdentitiesItem < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamCloudEventUserDeletedObjectIdentitiesItemCustom }
      member -> { Auth0::Types::EventStreamCloudEventUserDeletedObjectIdentitiesItemDatabase }
      member -> { Auth0::Types::EventStreamCloudEventUserDeletedObjectIdentitiesItemEnterprise }
      member -> { Auth0::Types::EventStreamCloudEventUserDeletedObjectIdentitiesItemPasswordless }
      member -> { Auth0::Types::EventStreamCloudEventUserDeletedObjectIdentitiesItemSocial }
    end
  end
end
