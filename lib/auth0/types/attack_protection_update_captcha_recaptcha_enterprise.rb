# frozen_string_literal: true

module Auth0
  module Types
    class AttackProtectionUpdateCaptchaRecaptchaEnterprise < Internal::Types::Model
      field :site_key, -> { String }, optional: false, nullable: false
      field :api_key, -> { String }, optional: false, nullable: false
      field :project_id, -> { String }, optional: false, nullable: false
    end
  end
end
