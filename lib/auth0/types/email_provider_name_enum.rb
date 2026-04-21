# frozen_string_literal: true

module Auth0
  module Types
    module EmailProviderNameEnum
      extend Auth0::Internal::Types::Enum

      MAILGUN = "mailgun"
      MANDRILL = "mandrill"
      SENDGRID = "sendgrid"
      SES = "ses"
      SPARKPOST = "sparkpost"
      SMTP = "smtp"
      AZURE_CS = "azure_cs"
      MS365 = "ms365"
      CUSTOM = "custom"
    end
  end
end
