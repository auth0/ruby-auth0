# frozen_string_literal: true

module Auth0
  module Types
    # Configure FedCM login settings for New Universal Login
    class FedCmLogin < Internal::Types::Model
      field :google, -> { Auth0::Types::FedCmLoginGoogle }, optional: true, nullable: false
    end
  end
end
