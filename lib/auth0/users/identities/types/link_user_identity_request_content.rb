# frozen_string_literal: true

module Auth0
  module Users
    module Identities
      module Types
        class LinkUserIdentityRequestContent < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :provider, -> { Auth0::Types::UserIdentityProviderEnum }, optional: true, nullable: false
          field :connection_id, -> { String }, optional: true, nullable: false
          field :user_id, -> { Auth0::Types::UserID }, optional: true, nullable: false
          field :link_with, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
