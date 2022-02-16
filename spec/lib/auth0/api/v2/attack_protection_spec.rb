require 'spec_helper'

describe Auth0::Api::V2::AttackProtection do
  before :all do
    dummy_instance = DummyClass.new
    dummy_instance.extend(Auth0::Api::V2::AttackProtection)
    @instance = dummy_instance
  end

  context '.attack_protection' do
    it 'is expected to respond to a breached_password_detection method' do
      expect(@instance).to respond_to(:breached_password_detection)
    end

    it 'is expected to respond to get_breached_password_detection_settings' do
      expect(@instance).to respond_to(:get_breached_password_detection_settings)
    end

    it 'is expected to get /api/v2/attack-protection/breached-password' do
      expect(@instance).to receive(:get).with(
        '/api/v2/attack-protection/breached-password-detection'
      )

      expect { @instance.breached_password_detection }.not_to raise_error
    end
  end
end