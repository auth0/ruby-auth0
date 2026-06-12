# frozen_string_literal: true

module Auth0
  module Types
    # Security headers configuration for tenant responses.
    class TenantSettingsNullableSecurityHeaders < Internal::Types::Model
      field :content_security_policy, -> { Auth0::Types::ContentSecurityPolicyConfig }, optional: true, nullable: false

      field :x_xss_protection, -> { Auth0::Types::XSSProtectionConfig }, optional: true, nullable: false
    end
  end
end
