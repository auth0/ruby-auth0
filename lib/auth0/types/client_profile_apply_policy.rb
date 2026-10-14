# frozen_string_literal: true

module Auth0
  module Types
    # Runtime matching rules that determine which clients this profile governs.
    class ClientProfileApplyPolicy < Internal::Types::Model
      field :external_metadata_type, -> { Auth0::Types::ClientProfileApplyPolicyExternalMetadataTypeEnum }, optional: false, nullable: false

      field :external_metadata_created_by, -> { Auth0::Types::ClientProfileApplyPolicyExternalMetadataCreatedByEnum }, optional: false, nullable: false
    end
  end
end
