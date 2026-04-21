# frozen_string_literal: true

module Auth0
  module Types
    class FormEndingNode < Internal::Types::Model
      field :redirection, -> { Auth0::Types::FormEndingNodeRedirection }, optional: true, nullable: false
      field :after_submit, -> { Auth0::Types::FormEndingNodeAfterSubmit }, optional: true, nullable: false
      field :coordinates, -> { Auth0::Types::FormNodeCoordinates }, optional: true, nullable: false
      field :resume_flow, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
