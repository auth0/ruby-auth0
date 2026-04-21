# frozen_string_literal: true

module Auth0
  module Types
    class NetworkACLRule < Internal::Types::Model
      field :action, -> { Auth0::Types::NetworkACLAction }, optional: false, nullable: false
      field :match, -> { Auth0::Types::NetworkACLMatch }, optional: true, nullable: false
      field :not_match, -> { Auth0::Types::NetworkACLMatch }, optional: true, nullable: false
      field :scope, -> { Auth0::Types::NetworkACLRuleScopeEnum }, optional: false, nullable: false
    end
  end
end
