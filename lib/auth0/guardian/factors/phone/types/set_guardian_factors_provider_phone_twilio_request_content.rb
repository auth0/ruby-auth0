# frozen_string_literal: true

module Auth0
  module Guardian
    module Factors
      module Phone
        module Types
          class SetGuardianFactorsProviderPhoneTwilioRequestContent < Internal::Types::Model
            field :from, -> { String }, optional: true, nullable: false
            field :messaging_service_sid, -> { String }, optional: true, nullable: false
            field :auth_token, -> { String }, optional: true, nullable: false
            field :sid, -> { String }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
