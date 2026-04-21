# frozen_string_literal: true

module Auth0
  module Types
    # Semver denotes the major.minor version of an integration release
    class IntegrationSemVer < Internal::Types::Model
      field :major, -> { Integer }, optional: true, nullable: false
      field :minor, -> { Integer }, optional: true, nullable: false
    end
  end
end
