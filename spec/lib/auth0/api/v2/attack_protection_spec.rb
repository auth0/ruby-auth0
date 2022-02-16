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
  end
end