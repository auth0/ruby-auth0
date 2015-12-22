require 'spec_helper'
describe Auth0::Api::V2::Blacklists do
  let(:client) { Auth0Client.new(v2_creds) }
  let(:token) { 'faketoken' }

  describe '.add_token_to_blacklist' do
    it { expect(client.add_token_to_blacklist(token)).to be_nil }
  end

  describe '.blacklisted_tokens' do
    let(:response) { { 'aud' => ENV['GLOBAL_CLIENT_ID'], 'jti' => token } }
    it { expect(client.blacklisted_tokens).to include response }
  end
end
