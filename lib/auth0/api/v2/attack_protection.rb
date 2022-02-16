module Auth0
  module Api
    module V2
      module AttackProtection
        attr_reader :attack_protection_path

        def breached_password_detection
          get(breached_password_settings_path)
        end
        alias get_breached_password_detection_settings breached_password_detection

        def patch_breached_password_detection(body)
          patch(breached_password_settings_path, body)
        end

        def brute_force_protection
          get(brute_force_protection_settings_path)
        end
        alias get_brute_force_protection_settings brute_force_protection

        def patch_brute_force_protection(body)
          patch(brute_force_protection_settings_path, body)
        end
        alias update_brute_force_protection_settings patch_brute_force_protection

        def suspicious_ip_throttling
          get(suspicious_ip_throttling_settings_path)
        end
        alias get_suspicious_ip_throttling_settings suspicious_ip_throttling

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
