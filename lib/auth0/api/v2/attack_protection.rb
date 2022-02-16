module Auth0
  module Api
    module V2
      module AttackProtection
        attr_reader :attack_protection_path

        def breached_password_detection
          get(breached_password_settings_path)
        end
        alias get_breached_password_detection_settings breached_password_detection
        
        private
        
        def attack_protection_path
          @attack_protection_path ||= '/api/v2/attack-protection'
        end
        
        def breached_password_settings_path
          "#{attack_protection_path}/breached-password-detection"
        end
      end
    end
  end
end
