# frozen_string_literal: true

module Auth0
  module Types
    # Dependency is an npm module. These values are used to produce an immutable artifact, which manifests as a
    # layer_id.
    class ActionVersionDependency < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :version, -> { String }, optional: true, nullable: false
      field :registry_url, -> { String }, optional: true, nullable: false
    end
  end
end
