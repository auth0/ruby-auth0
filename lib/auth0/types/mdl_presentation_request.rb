# frozen_string_literal: true

module Auth0
  module Types
    # A simplified presentation request
    class MdlPresentationRequest < Internal::Types::Model
      field :org_iso1801351m_dl, -> { Auth0::Types::MdlPresentationRequestProperties }, optional: false, nullable: false, api_name: "org.iso.18013.5.1.mDL"
    end
  end
end
