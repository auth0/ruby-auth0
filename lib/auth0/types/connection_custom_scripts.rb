# frozen_string_literal: true

module Auth0
  module Types
    # A map of scripts used to integrate with a custom database.
    class ConnectionCustomScripts < Internal::Types::Model
      field :login, -> { String }, optional: true, nullable: false
      field :get_user, -> { String }, optional: true, nullable: false
      field :delete, -> { String }, optional: true, nullable: false
      field :change_password, -> { String }, optional: true, nullable: false
      field :verify, -> { String }, optional: true, nullable: false
      field :create, -> { String }, optional: true, nullable: false
      field :change_username, -> { String }, optional: true, nullable: false
      field :change_email, -> { String }, optional: true, nullable: false
      field :change_phone_number, -> { String }, optional: true, nullable: false
    end
  end
end
