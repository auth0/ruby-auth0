# frozen_string_literal: true

module Auth0
  module Types
    class DailyStats < Internal::Types::Model
      field :date, -> { String }, optional: true, nullable: false
      field :logins, -> { Integer }, optional: true, nullable: false
      field :signups, -> { Integer }, optional: true, nullable: false
      field :leaked_passwords, -> { Integer }, optional: true, nullable: false
      field :updated_at, -> { String }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
    end
  end
end
