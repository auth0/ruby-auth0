# frozen_string_literal: true

module Auth0
  module ClientGrants
    module Types
      class ListClientGrantsRequestParameters < Internal::Types::Model
        field :from, -> { String }, optional: true, nullable: false
        field :take, -> { Integer }, optional: true, nullable: false
        field :audience, -> { String }, optional: true, nullable: false
        field :client_id, -> { String }, optional: true, nullable: false
        field :allow_any_organization, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :subject_type, -> { Auth0::Types::ClientGrantSubjectTypeEnum }, optional: true, nullable: false
        field :default_for, -> { Auth0::Types::ClientGrantDefaultForEnum }, optional: true, nullable: false
      end
    end
  end
end
