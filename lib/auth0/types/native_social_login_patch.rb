# frozen_string_literal: true

module Auth0
  module Types
    # Configure native social settings
    class NativeSocialLoginPatch < Internal::Types::Model
      field :apple, -> { Auth0::Types::NativeSocialLoginApplePatch }, optional: true, nullable: false

      field :facebook, -> { Auth0::Types::NativeSocialLoginFacebookPatch }, optional: true, nullable: false

      field :google, -> { Auth0::Types::NativeSocialLoginGooglePatch }, optional: true, nullable: false
    end
  end
end
