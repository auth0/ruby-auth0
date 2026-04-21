# frozen_string_literal: true

module Auth0
  module Types
    class AttackProtectionCaptchaRecaptchaEnterpriseResponseContent < Internal::Types::Model
      field :site_key, -> { String }, optional: true, nullable: false
      field :project_id, -> { String }, optional: true, nullable: false
    end
  end
end
