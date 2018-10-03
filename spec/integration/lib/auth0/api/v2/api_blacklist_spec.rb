require 'spec_helper'
describe Auth0::Api::V2::Blacklists do
  let(:client) { Auth0Client.new(v2_creds) }
  let(:token) { 'faketoken' }

  describe '.add_token_to_blacklist', vcr: true do
    it 'should add a token to the blacklist' do
      expect do
        client.add_token_to_blacklist(
          token,
          v2_creds[:client_id]
        )
      end.to_not raise_error
    end
  end

  describe '.blacklisted_tokens', vcr: true do
    it 'should get the added token from the blacklist' do
      expect(client.blacklisted_tokens.first).to(
        include(
          'aud' => v2_creds[:client_id],
          'jti' => token
        )
      )
    end
  end
end
