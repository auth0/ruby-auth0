# frozen_string_literal: true

module Auth0
  module Types
    # Identity object when accounts are linked.
    class EventStreamCloudEventUserCreatedObjectIdentitiesItem < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamCloudEventUserCreatedObjectIdentitiesItemCustom }

      member -> { Auth0::Types::EventStreamCloudEventUserCreatedObjectIdentitiesItemDatabase }

      member -> { Auth0::Types::EventStreamCloudEventUserCreatedObjectIdentitiesItemEnterprise }

      member -> { Auth0::Types::EventStreamCloudEventUserCreatedObjectIdentitiesItemPasswordless }

      member -> { Auth0::Types::EventStreamCloudEventUserCreatedObjectIdentitiesItemSocial }
    end
  end
end
