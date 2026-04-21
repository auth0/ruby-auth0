# frozen_string_literal: true

module Auth0
  module Types
    class UpdateEmailTemplateResponseContent < Internal::Types::Model
      field :template, -> { Auth0::Types::EmailTemplateNameEnum }, optional: true, nullable: false
      field :body, -> { String }, optional: true, nullable: false
      field :from, -> { String }, optional: true, nullable: false
      field :result_url, -> { String }, optional: true, nullable: false, api_name: "resultUrl"
      field :subject, -> { String }, optional: true, nullable: false
      field :syntax, -> { String }, optional: true, nullable: false
      field :url_lifetime_in_seconds, -> { Integer }, optional: true, nullable: false, api_name: "urlLifetimeInSeconds"
      field :include_email_in_redirect, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "includeEmailInRedirect"
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
