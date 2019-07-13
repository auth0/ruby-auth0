require 'spec_helper'
describe Auth0::Api::V2::Anomaly do
  let(:client) { Auth0Client.new(v2_creds) }
  let(:ip) { '192.0.2.0' }

  describe '.check_if_ip_is_blocked', vcr: true do
    it 'should return 200 response code' do
      expect { client.check_if_ip_is_blocked(ip) }.to_not raise_error
    end
  end

  describe '.remove_ip_block', vcr: true do
    it 'should remove an IP successfully' do
      expect { client.remove_ip_block(ip) }.to_not raise_error
    end
  end
end
