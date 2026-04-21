# frozen_string_literal: true

module Auth0
  module Types
    class FormBlockResendButtonConfig < Internal::Types::Model
      field :active_text, -> { String }, optional: false, nullable: false
      field :button_text, -> { String }, optional: false, nullable: false
      field :waiting_text, -> { String }, optional: false, nullable: false
      field :text_alignment, -> { Auth0::Types::FormBlockResendButtonConfigTextAlignmentEnum }, optional: true, nullable: false
      field :flow_id, -> { String }, optional: false, nullable: false
      field :max_attempts, -> { Integer }, optional: true, nullable: false
      field :waiting_time, -> { Integer }, optional: true, nullable: false
    end
  end
end
