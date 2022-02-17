require 'spec_helper'

describe Auth0::Api::V2::AttackProtection do
  before :all do
    dummy_instance = DummyClass.new
    dummy_instance.extend(Auth0::Api::V2::AttackProtection)
    @instance = dummy_instance
  end

  context '.get breached-password-detection' do
    it 'responds to a breached_password_detection method' do
      expect(@instance).to respond_to(:breached_password_detection)
    end

    it 'responds to get_breached_password_detection_settings' do
      expect(@instance).to respond_to(:get_breached_password_detection_settings)
    end

    it 'is expected to get /api/v2/attack-protection/breached-password' do
      expect(@instance).to receive(:get).with(
        '/api/v2/attack-protection/breached-password-detection'
      )

      expect { @instance.breached_password_detection }.not_to raise_error
    end
  end

  context '.patch breached-password-detection' do
    it 'responds to a patch_breached_password_detection method' do
      expect(@instance).to respond_to(:patch_breached_password_detection)
    end

    it 'responds to a update_breached_password_detection_settings method' do
      expect(@instance).to respond_to(:update_breached_password_detection_settings)
    end

    it 'is expected to patch /api/v2/attack-protection/breached-password-detection' do
      expect(@instance).to receive(:patch).with(
        '/api/v2/attack-protection/breached-password-detection',
        {
          enabled: true
        }
      )

      @instance.patch_breached_password_detection({
        enabled: true
      })
    end
  end

  context '.get brute_force_protection' do
    it 'responds to brute_force_protection' do
      expect(@instance).to respond_to(:brute_force_protection)
    end

    it 'responds to get_brute_force_protection_settings' do
      expect(@instance).to respond_to(:get_brute_force_protection_settings)
    end

    it 'is expected to get /api/v2/attack-protection/brute-force-protection' do
      expect(@instance).to receive(:get).with(
        '/api/v2/attack-protection/brute-force-protection'
      )

      expect { @instance.brute_force_protection }.not_to raise_error
    end
  end

  context '.patch brute-force-protection' do
    it 'responds to patch_brute-force-protection' do
      expect(@instance).to respond_to(:patch_brute_force_protection)
    end

    it 'responds to update_brute_force_protection_settings' do
      expect(@instance).to respond_to(:update_brute_force_protection_settings)
    end

    it 'is expected to respond to patch /api/v2/attack-protection/brute-force-protection' do
      expect(@instance).to receive(:patch).with(
        '/api/v2/attack-protection/brute-force-protection',
        {
          enabled: true
        }
      )

      @instance.patch_brute_force_protection({
        enabled: true
      })
    end
  end

  context '.get suspicious-ip-throttling' do
    it 'responds to suspicious_ip_throttling' do
      expect(@instance).to respond_to(:suspicious_ip_throttling)
    end

    it 'responds to get_suspicious_ip_throttling_settings' do
      expect(@instance).to respond_to(:get_suspicious_ip_throttling_settings)
    end

    it 'is expected to get /api/v2/attack-protection/suspicious-ip-throttling' do
      expect(@instance).to receive(:get).with(
        '/api/v2/attack-protection/suspicious-ip-throttling'
      )

      expect { @instance.suspicious_ip_throttling }.not_to raise_error
    end
  end

  context '.patch suspicious-ip-throttling' do
    it 'responds to patch_suspicious_ip_throttling' do
      expect(@instance).to respond_to(:patch_suspicious_ip_throttling)
    end

    it 'responds to update_suspicious_ip_throttling_settings' do
      expect(@instance).to respond_to(:update_suspicious_ip_throttling_settings)
    end

    it 'is expected to patch /api/v2/attack-protection/suspicious-ip-throttling' do
      expect(@instance).to receive(:patch).with(
        '/api/v2/attack-protection/suspicious-ip-throttling',
        {
          enabled: true
        }
      )

      @instance.patch_suspicious_ip_throttling({
        enabled: true
      })
    end
  end
end