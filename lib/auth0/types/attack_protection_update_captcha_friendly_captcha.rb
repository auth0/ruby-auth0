# frozen_string_literal: true

module Auth0
  module Types
    class AttackProtectionUpdateCaptchaFriendlyCaptcha < Internal::Types::Model
      field :site_key, -> { String }, optional: false, nullable: false
      field :secret, -> { String }, optional: false, nullable: false
    end
  end
end
