require 'spec_helper'

class MockClass
  attr_reader :token
  include Auth0::Mixins::Initializer
  include HTTParty
end

describe Auth0::Mixins::Initializer do
  let(:params) { { namespace: 'samples.auth0.com' } }
  let(:instance) { DummyClassForProxy.send(:include, described_class).new(params) }
  context 'api v2' do
    before do
      params[:api_version] = 2
    end

    it 'sets token when access_token is passed' do
      params[:access_token] = '123'

      expect(instance.instance_variable_get('@token')).to eq('123')
    end

    it 'sets token when token is passed' do
      params[:token] = '123'

      expect(instance.instance_variable_get('@token')).to eq('123')
    end
  end
end
