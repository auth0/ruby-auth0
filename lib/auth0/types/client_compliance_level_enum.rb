# frozen_string_literal: true

module Auth0
  module Types
    module ClientComplianceLevelEnum
      extend Auth0::Internal::Types::Enum

      NONE = "none"
      FAPI1ADV_PKJ_PAR = "fapi1_adv_pkj_par"
      FAPI1ADV_MTLS_PAR = "fapi1_adv_mtls_par"
      FAPI2SP_PKJ_MTLS = "fapi2_sp_pkj_mtls"
      FAPI2SP_MTLS_MTLS = "fapi2_sp_mtls_mtls"
    end
  end
end
