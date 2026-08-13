# frozen_string_literal: true

module Auth0
  module Types
    class MdlPresentationRequestProperties < Internal::Types::Model
      field :org_iso1801351, -> { Auth0::Types::MdlPresentationProperties }, optional: false, nullable: false, api_name: "org.iso.18013.5.1"
    end
  end
end
