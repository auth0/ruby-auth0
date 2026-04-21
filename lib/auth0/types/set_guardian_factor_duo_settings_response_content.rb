# frozen_string_literal: true

module Auth0
  module Types
    class SetGuardianFactorDuoSettingsResponseContent < Internal::Types::Model
      field :ikey, -> { String }, optional: true, nullable: false
      field :skey, -> { String }, optional: true, nullable: false
      field :host, -> { String }, optional: true, nullable: false
    end
  end
end
