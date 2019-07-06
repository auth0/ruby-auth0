require 'spec_helper'
describe Auth0::Api::V2::Anomaly do
  before :all do
    dummy_instance = DummyClass.new
    dummy_instance.extend(Auth0::Api::V2::Anomaly)
    @instance = dummy_instance
  end

  context '.check_if_ip_is_blocked' do
    it { expect(@instance).to respond_to(:check_if_ip_is_blocked) }
    it 'expect client to send get to /api/v2/anomaly/blocks/ips/192.0.2.0' do
      expect(@instance).to receive(:get).with('/api/v2/anomaly/blocks/ips/192.0.2.0')
      expect { @instance.check_if_ip_is_blocked('192.0.2.0') }.not_to raise_error
    end
    it { expect { @instance.check_if_ip_is_blocked('') }.to raise_error('Must specify an IP') }
  end

  context '.remove_ip_block' do
    it { expect(@instance).to respond_to(:remove_ip_block) }
    it 'expect client to send delete to /api/v2/anomaly/blocks/ips/192.0.2.0' do
      expect(@instance).to receive(:delete).with('/api/v2/anomaly/blocks/ips/192.0.2.0')
      expect { @instance.remove_ip_block('192.0.2.0') }.not_to raise_error
    end
    it { expect { @instance.remove_ip_block('') }.to raise_error('Must specify an IP') }
  end
end
