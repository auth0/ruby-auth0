# frozen_string_literal: true

require 'spec_helper'

describe Auth0::Api::V2::RefreshTokens do
  before :all do
    dummy_instance = DummyClass.new
    dummy_instance.extend(Auth0::Api::V2::RefreshTokens)
    @instance = dummy_instance
  end

  describe '.refresh_token' do
    it 'is expected to respond to a refresh_token method' do
      expect(@instance).to respond_to(:refresh_token)
    end

    it 'is expected to GET a refresh_token' do
      expect(@instance).to receive(:get).with(
        '/api/v2/refresh-tokens/REFRESH_TOKEN_ID'
      )

      expect do
        @instance.refresh_token('REFRESH_TOKEN_ID')
      end.not_to raise_error
    end

    it 'is expected to raise an exception when the id is empty' do
      expect { @instance.refresh_token(nil) }.to raise_error('Must supply a valid id')
    end
  end

  describe '.delete_refresh_token' do
    it 'is expected to respond to a delete_refresh_token method' do
      expect(@instance).to respond_to(:delete_refresh_token)
    end

    it 'is expected to DELETE a refresh_token' do
      expect(@instance).to receive(:delete).with(
        '/api/v2/refresh-tokens/REFRESH_TOKEN_ID'
      )

      expect do
        @instance.delete_refresh_token('REFRESH_TOKEN_ID')
      end.not_to raise_error
    end

    it 'is expected to raise an exception when the id is empty' do
      expect { @instance.delete_refresh_token(nil) }.to raise_error('Must supply a valid id')
    end
  end
end
