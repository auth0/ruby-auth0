# frozen_string_literal: true

module Auth0
  module Types
    class PageComponentNoChildren < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      discriminant :type

      member -> { Auth0::Types::PageComponentAuth0Form }, key: "PAGE_COMPONENT_AUTH0FORM"

      member -> { Auth0::Types::PageComponentAuth0TypographyHeading }, key: "PAGE_COMPONENT_AUTH0TYPOGRAPHY_HEADING"

      member -> { Auth0::Types::PageComponentAuth0MediaImage }, key: "PAGE_COMPONENT_AUTH0MEDIA_IMAGE"

      member -> { Auth0::Types::PageComponentAuth0TypographyRichText }, key: "PAGE_COMPONENT_AUTH0TYPOGRAPHY_RICH_TEXT"

      member -> { Auth0::Types::PageComponentAuth0StructureSeparator }, key: "PAGE_COMPONENT_AUTH0STRUCTURE_SEPARATOR"

      member -> { Auth0::Types::PageComponentAuth0MyOrganizationDomainTable }, key: "PAGE_COMPONENT_AUTH0MY_ORGANIZATION_DOMAIN_TABLE"

      member -> { Auth0::Types::PageComponentAuth0MyOrganizationMemberManagement }, key: "PAGE_COMPONENT_AUTH0MY_ORGANIZATION_MEMBER_MANAGEMENT"

      member -> { Auth0::Types::PageComponentAuth0MyOrganizationDetailsEdit }, key: "PAGE_COMPONENT_AUTH0MY_ORGANIZATION_DETAILS_EDIT"

      member -> { Auth0::Types::PageComponentAuth0MyAccountPasskeyManagement }, key: "PAGE_COMPONENT_AUTH0MY_ACCOUNT_PASSKEY_MANAGEMENT"

      member -> { Auth0::Types::PageComponentAuth0MyAccountMfaManagement }, key: "PAGE_COMPONENT_AUTH0MY_ACCOUNT_MFA_MANAGEMENT"
    end
  end
end
