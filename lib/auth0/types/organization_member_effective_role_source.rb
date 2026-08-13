# frozen_string_literal: true

module Auth0
  module Types
    module OrganizationMemberEffectiveRoleSource
      extend Auth0::Internal::Types::Enum

      DIRECT = "direct"
      GROUPS = "groups"
    end
  end
end
