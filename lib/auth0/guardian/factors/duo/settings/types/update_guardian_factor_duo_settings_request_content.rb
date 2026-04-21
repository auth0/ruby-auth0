# frozen_string_literal: true

module Auth0
  module Guardian
    module Factors
      module Duo
        module Settings
          module Types
            class UpdateGuardianFactorDuoSettingsRequestContent < Internal::Types::Model
              field :ikey, -> { String }, optional: true, nullable: false
              field :skey, -> { String }, optional: true, nullable: false
              field :host, -> { String }, optional: true, nullable: false
            end
          end
        end
      end
    end
  end
end
