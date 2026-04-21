# frozen_string_literal: true

module Auth0
  module Types
    class LogStreamFilter < Internal::Types::Model
      field :type, -> { Auth0::Types::LogStreamFilterTypeEnum }, optional: true, nullable: false
      field :name, -> { Auth0::Types::LogStreamFilterGroupNameEnum }, optional: true, nullable: false
    end
  end
end
