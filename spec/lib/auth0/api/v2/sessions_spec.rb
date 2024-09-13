# frozen_string_literal: true

require 'spec_helper'
describe Auth0::Api::V2::Sessions do
  before :all do
    dummy_instance = DummyClass.new
    dummy_instance.extend(Auth0::Api::V2::Sessions)
    @instance = dummy_instance
  end
  context '.session' do
    it 'is expected to respond to a session method' do
      expect(@instance).to respond_to(:session)
    end

    it 'is expected to GET a session' do
      expect(@instance).to receive(:get).with(
        '/api/v2/sessions/SESSION_ID'
      )

      expect do
        @instance.session('SESSION_ID')
      end.not_to raise_error
    end

    it 'is expected to raise an exception when the session ID is empty' do
      expect { @instance.session(nil) }.to raise_error('Must supply a valid session_id')
    end
  end
  context '.delete_session' do
    it 'is expected to respond to a delete_session method' do
      expect(@instance).to respond_to(:delete_session)
    end

    it 'is expected to DELETE a session' do
      expect(@instance).to receive(:delete).with(
        '/api/v2/sessions/SESSION_ID'
      )

      expect do
        @instance.delete_session('SESSION_ID')
      end.not_to raise_error
    end

    it 'is expected to raise an exception when the session ID is empty' do
      expect { @instance.delete_session(nil) }.to raise_error('Must supply a valid session_id')
    end
  end
end
