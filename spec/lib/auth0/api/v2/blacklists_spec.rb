require 'spec_helper'
describe Auth0::Api::V2::Blacklists do
  before :all do
    dummy_instance = DummyClass.new
    dummy_instance.extend(Auth0::Api::V2::Blacklists)
    @instance = dummy_instance
  end

  context '.blacklisted_tokens' do
    it { expect(@instance).to respond_to(:blacklisted_tokens) }
    it 'is expected to call /api/v2/blacklists/tokens' do
      expect(@instance).to receive(:get).with('/api/v2/blacklists/tokens', { aud: nil })
      expect { @instance.blacklisted_tokens }.not_to raise_error
    end
  end

  context '.add_token.to_blacklist' do
    it { expect(@instance).to respond_to(:add_token_to_blacklist) }
    it 'is expected to call post to /api/v2/blacklists/tokens' do
      expect(@instance).to receive(:post).with('/api/v2/blacklists/tokens', { aud: 'aud', jti: 'jti' })
      @instance.add_token_to_blacklist('jti', 'aud')
    end
    it { expect { @instance.add_token_to_blacklist('', '') }.to raise_error 'Must specify a valid JTI' }
  end
end
