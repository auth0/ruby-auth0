# frozen_string_literal: true

module Auth0
  module Branding
    module Phone
      class Client
        # @param client [Auth0::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # @return [Auth0::Providers::Client]
        def providers
          @providers ||= Auth0::Branding::Phone::Providers::Client.new(client: @client)
        end

        # @return [Auth0::Templates::Client]
        def templates
          @templates ||= Auth0::Branding::Phone::Templates::Client.new(client: @client)
        end
      end
    end
  end
end
