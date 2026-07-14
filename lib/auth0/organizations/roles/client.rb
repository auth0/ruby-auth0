# frozen_string_literal: true

module Auth0
  module Organizations
    module Roles
      class Client
        # @param client [Auth0::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # @return [Auth0::Members::Client]
        def members
          @members ||= Auth0::Organizations::Roles::Members::Client.new(client: @client)
        end
      end
    end
  end
end
