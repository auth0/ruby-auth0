require 'spec_helper'
require 'timecop'

class MockClass
  attr_reader :token
  include Auth0::Mixins::Initializer
  include Auth0::Mixins::HTTPProxy
  include Auth0::Mixins::Headers
  include Auth0::Mixins::TokenManagement
end

describe Auth0::Mixins::Initializer do
  let(:params) { { namespace: 'samples.auth0.com' } }
  let(:instance) { DummyClassForProxy.send(:include, described_class).new(params) }
  let(:time_now) { Time.now }
  context 'api v2' do
    before do
      params[:api_version] = 2
      Timecop.freeze(time_now)
    end

    after do
      Timecop.return
    end

    it 'sets token when access_token is passed' do
      params[:access_token] = '123'

      expect(instance.instance_variable_get('@token')).to eq('123')
    end

    it 'sets token when token is passed' do
      params[:token] = '123'

      expect(instance.instance_variable_get('@token')).to eq('123')
    end

    it 'sets retry_count when passed' do
      params[:token] = '123'
      params[:retry_count] = 10

      expect(instance.instance_variable_get('@retry_count')).to eq(10)
    end

    it 'sets token_response' do
      params[:client_id] = client_id = 'test_client_id'
      params[:client_secret] = client_secret = 'test_client_secret'
      params[:api_identifier] = api_identifier = 'test'

      payload = {
        grant_type: 'client_credentials',
        client_id: client_id,
        client_secret: client_secret,
        audience: api_identifier
      }  

      expect(RestClient::Request).to receive(:execute).with(hash_including(
        method: :post,
        url: 'https://samples.auth0.com/oauth/token',
        payload: payload.to_json
      ))
      .and_return(StubResponse.new({ 
        "access_token" => "test", 
        "expires_in" => 86400}, 
        true, 
        200))

      expect(instance.instance_variable_get('@token_response')).to eq(
        ::Auth0::ApiToken.new 'test', nil, 86400, Time.now.to_i + 86400
      )
    end
  end
end
