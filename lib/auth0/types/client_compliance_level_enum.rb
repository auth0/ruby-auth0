# frozen_string_literal: true

module Auth0
  module Types
    module ClientComplianceLevelEnum
      extend Auth0::Internal::Types::Enum

      NONE = "none"
      FAPI1_ADV_PKJ_PAR = "fapi1_adv_pkj_par"
      FAPI1_ADV_MTLS_PAR = "fapi1_adv_mtls_par"
      FAPI2_SP_PKJ_MTLS = "fapi2_sp_pkj_mtls"
      FAPI2_SP_MTLS_MTLS = "fapi2_sp_mtls_mtls"
    end
  end
end
