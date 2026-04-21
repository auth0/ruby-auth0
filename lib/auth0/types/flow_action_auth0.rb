# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionAuth0 < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::FlowActionAuth0CreateUser }
      member -> { Auth0::Types::FlowActionAuth0GetUser }
      member -> { Auth0::Types::FlowActionAuth0UpdateUser }
      member -> { Auth0::Types::FlowActionAuth0SendRequest }
      member -> { Auth0::Types::FlowActionAuth0SendEmail }
      member -> { Auth0::Types::FlowActionAuth0SendSms }
      member -> { Auth0::Types::FlowActionAuth0MakeCall }
    end
  end
end
