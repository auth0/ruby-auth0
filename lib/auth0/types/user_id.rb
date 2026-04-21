# frozen_string_literal: true

module Auth0
  module Types
    # user_id of the secondary user account being linked.
    class UserID < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { String }
      member -> { Integer }
    end
  end
end
