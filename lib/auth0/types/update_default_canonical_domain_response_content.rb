# frozen_string_literal: true

module Auth0
  module Types
    class UpdateDefaultCanonicalDomainResponseContent < Internal::Types::Model
      field :domain, -> { String }, optional: false, nullable: false
    end
  end
end
