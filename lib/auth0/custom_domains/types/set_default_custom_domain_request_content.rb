# frozen_string_literal: true

module Auth0
  module CustomDomains
    module Types
      class SetDefaultCustomDomainRequestContent < Internal::Types::Model
        field :domain, -> { String }, optional: false, nullable: false
      end
    end
  end
end
