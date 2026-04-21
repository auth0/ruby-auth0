# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionPipedrive < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::FlowActionPipedriveAddDeal }
      member -> { Auth0::Types::FlowActionPipedriveAddOrganization }
      member -> { Auth0::Types::FlowActionPipedriveAddPerson }
    end
  end
end
