# frozen_string_literal: true

module Auth0
  module Types
    # Email template configuration
    class ConnectionEmailEmail < Internal::Types::Model
      field :body, -> { String }, optional: true, nullable: false
      field :from, -> { String }, optional: true, nullable: false
      field :subject, -> { String }, optional: true, nullable: false
      field :syntax, -> { Auth0::Types::ConnectionEmailEmailSyntax }, optional: true, nullable: false
    end
  end
end
