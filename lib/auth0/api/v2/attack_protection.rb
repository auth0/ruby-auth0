module Auth0
  module Api
    module V2
      # Methods to use the attack-protection endpoints
      module AttackProtection
        attr_reader :attack_protection_path

        # Get breached password detection settings
        # @see https://auth0.com/docs/api/management/v2#!/Attack_Protection/get_breached_password_detection
        # @return [json] The configuration for breached password detection
        def breached_password_detection
          get(breached_password_settings_path)
        end
        alias get_breached_password_detection_settings breached_password_detection

        # Update breached password detection settings
        # @see https://auth0.com/docs/api/management/v2#!/Attack_Protection/patch_breached_password_detection
        # @param body [hash] See https://auth0.com/docs/api/management/v2#!/Attack_Protection/patch_breached_password_detection for available options
        # @return [json] The configuration for breached password detection
        def patch_breached_password_detection(body)
          patch(breached_password_settings_path, body)
        end

        # Get brute force protection settings.
        # @see https://auth0.com/docs/api/management/v2#!/Attack_Protection/get_brute_force_protection
        # @return [json] The configuration for brute force protection
        def brute_force_protection
          get(brute_force_protection_settings_path)
        end
        alias get_brute_force_protection_settings brute_force_protection

        # Update brute force protection settings.
        # @see https://auth0.com/docs/api/management/v2#!/Attack_Protection/patch_brute_force_protection
        # @param body [hash] See https://auth0.com/docs/api/management/v2#!/Attack_Protection/patch_brute_force_protection for available options
        # @return [json] The configuration for brute force protection
        def patch_brute_force_protection(body)
          patch(brute_force_protection_settings_path, body)
        end
        alias update_brute_force_protection_settings patch_brute_force_protection

        # Get suspicious IP throttling settings
        # @see https://auth0.com/docs/api/management/v2#!/Attack_Protection/get_suspicious_ip_throttling
        # @return The configuration for suspicious IP throttling
        def suspicious_ip_throttling
          get(suspicious_ip_throttling_settings_path)
        end
        alias get_suspicious_ip_throttling_settings suspicious_ip_throttling

        # Update suspicious IP throttling settings
        # @see https://auth0.com/docs/api/management/v2#!/Attack_Protection/patch_suspicious_ip_throttling
        # @param body [hash] See https://auth0.com/docs/api/management/v2#!/Attack_Protection/patch_suspicious_ip_throttling for available options
        # @return The configuration for suspicious IP throttling
        def patch_suspicious_ip_throttling(body)
          patch(suspicious_ip_throttling_settings_path, body)
        end
        alias update_suspicious_ip_throttling_settings patch_suspicious_ip_throttling

        private
        
        def attack_protection_path
          @attack_protection_path ||= '/api/v2/attack-protection'
        end
        alias update_breached_password_detection_settings patch_breached_password_detection
        
        def breached_password_settings_path
          "#{attack_protection_path}/breached-password-detection"
        end

        def brute_force_protection_settings_path
          "#{attack_protection_path}/brute-force-protection"
        end

        def suspicious_ip_throttling_settings_path
          "#{attack_protection_path}/suspicious-ip-throttling"
        end
      end
    end
  end
end
