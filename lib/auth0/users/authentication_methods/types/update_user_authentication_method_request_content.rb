# frozen_string_literal: true

module Auth0
  module Users
    module AuthenticationMethods
      module Types
        class UpdateUserAuthenticationMethodRequestContent < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :authentication_method_id, -> { String }, optional: false, nullable: false
          field :name, -> { String }, optional: true, nullable: false
          field :preferred_authentication_method, -> { Auth0::Types::PreferredAuthenticationMethodEnum }, optional: true, nullable: false
        end
      end
    end
  end
end
