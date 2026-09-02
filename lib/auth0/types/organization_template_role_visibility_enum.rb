# frozen_string_literal: true

module Auth0
  module Types
    module OrganizationTemplateRoleVisibilityEnum
      extend Auth0::Internal::Types::Enum

      WRITE = "write"
      READ_ONLY = "read_only"
      HIDDEN = "hidden"
    end
  end
end
