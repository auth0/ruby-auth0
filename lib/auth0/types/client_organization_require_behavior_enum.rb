# frozen_string_literal: true

module Auth0
  module Types
    module ClientOrganizationRequireBehaviorEnum
      extend Auth0::Internal::Types::Enum

      NO_PROMPT = "no_prompt"
      PRE_LOGIN_PROMPT = "pre_login_prompt"
      POST_LOGIN_PROMPT = "post_login_prompt"
    end
  end
end
