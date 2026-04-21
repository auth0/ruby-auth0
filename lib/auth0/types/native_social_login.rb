# frozen_string_literal: true

module Auth0
  module Types
    # Configure native social settings
    class NativeSocialLogin < Internal::Types::Model
      field :apple, -> { Auth0::Types::NativeSocialLoginApple }, optional: true, nullable: false
      field :facebook, -> { Auth0::Types::NativeSocialLoginFacebook }, optional: true, nullable: false
      field :google, -> { Auth0::Types::NativeSocialLoginGoogle }, optional: true, nullable: false
    end
  end
end
