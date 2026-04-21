# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionHubspotEnrollContactParamsWorkflowID < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { String }
      member -> { Integer }
    end
  end
end
