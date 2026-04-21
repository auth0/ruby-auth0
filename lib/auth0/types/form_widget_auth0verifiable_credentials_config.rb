# frozen_string_literal: true

module Auth0
  module Types
    class FormWidgetAuth0VerifiableCredentialsConfig < Internal::Types::Model
      field :url, -> { String }, optional: false, nullable: false
      field :size, -> { Integer }, optional: true, nullable: false
      field :alternate_text, -> { String }, optional: false, nullable: false
      field :access_token, -> { String }, optional: false, nullable: false
      field :verification_id, -> { String }, optional: false, nullable: false
      field :max_wait, -> { Integer }, optional: true, nullable: false
    end
  end
end
