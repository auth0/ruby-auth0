# frozen_string_literal: true

module Auth0
  module AttackProtection
    class Client
      # @param client [Auth0::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # @return [Auth0::BotDetection::Client]
      def bot_detection
        @bot_detection ||= Auth0::AttackProtection::BotDetection::Client.new(client: @client)
      end

      # @return [Auth0::BreachedPasswordDetection::Client]
      def breached_password_detection
        @breached_password_detection ||= Auth0::AttackProtection::BreachedPasswordDetection::Client.new(client: @client)
      end

      # @return [Auth0::BruteForceProtection::Client]
      def brute_force_protection
        @brute_force_protection ||= Auth0::AttackProtection::BruteForceProtection::Client.new(client: @client)
      end

      # @return [Auth0::Captcha::Client]
      def captcha
        @captcha ||= Auth0::AttackProtection::Captcha::Client.new(client: @client)
      end

      # @return [Auth0::SuspiciousIPThrottling::Client]
      def suspicious_ip_throttling
        @suspicious_ip_throttling ||= Auth0::AttackProtection::SuspiciousIPThrottling::Client.new(client: @client)
      end
    end
  end
end
