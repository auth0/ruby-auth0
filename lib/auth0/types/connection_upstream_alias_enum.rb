# frozen_string_literal: true

module Auth0
  module Types
    module ConnectionUpstreamAliasEnum
      extend Auth0::Internal::Types::Enum

      ACR_VALUES = "acr_values"
      AUDIENCE = "audience"
      CLIENT_ID = "client_id"
      DISPLAY = "display"
      ID_TOKEN_HINT = "id_token_hint"
      LOGIN_HINT = "login_hint"
      MAX_AGE = "max_age"
      PROMPT = "prompt"
      RESOURCE = "resource"
      RESPONSE_MODE = "response_mode"
      RESPONSE_TYPE = "response_type"
      UI_LOCALES = "ui_locales"
    end
  end
end
