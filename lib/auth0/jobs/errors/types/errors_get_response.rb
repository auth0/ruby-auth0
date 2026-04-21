# frozen_string_literal: true

module Auth0
  module Jobs
    module Errors
      module Types
        class ErrorsGetResponse < Internal::Types::Model
          extend Auth0::Internal::Types::Union

          member -> { Internal::Types::Array[Auth0::Types::GetJobErrorResponseContent] }
          member -> { Auth0::Types::GetJobGenericErrorResponseContent }
        end
      end
    end
  end
end
