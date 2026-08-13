# frozen_string_literal: true

module Auth0
  module Clients
    module Types
      class PreviewCimdMetadataRequestContent < Internal::Types::Model
        field :external_client_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
