# frozen_string_literal: true

module Auth0
  module Types
    module BruteForceProtectionModeEnum
      extend Auth0::Internal::Types::Enum

      COUNT_PER_IDENTIFIER_AND_IP = "count_per_identifier_and_ip"
      COUNT_PER_IDENTIFIER = "count_per_identifier"
    end
  end
end
