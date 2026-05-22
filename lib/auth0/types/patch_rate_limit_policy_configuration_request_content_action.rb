# frozen_string_literal: true

module Auth0
  module Types
    class PatchRateLimitPolicyConfigurationRequestContentAction < Internal::Types::Model
      field :action, -> { Auth0::Types::PatchRateLimitPolicyConfigurationRequestContentActionAction }, optional: false, nullable: false

      field :limit, -> { Integer }, optional: false, nullable: false

      field :redirect_uri, -> { String }, optional: false, nullable: false
    end
  end
end
