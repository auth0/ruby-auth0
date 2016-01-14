require 'spec_helper'
describe Auth0::Api::V2::Tickets do
  before :all do
    dummy_instance = DummyClass.new
    dummy_instance.extend(Auth0::Api::V2::Tickets)
    @instance = dummy_instance
  end

  context '.create_password_change_ticket' do
    it { expect(@instance).to respond_to(:create_password_change_ticket) }
    it 'is expected to call post to /api/v2/tickets/password-change' do
      expect(@instance).to receive(:post).with(
        '/api/v2/tickets/password-change',
        result_url: 'http://myapp.com/callback',
        user_id: 'auth0|user',
        connection: 'conn',
        email: 'test@test.com',
        new_password: 'password'
      )
      @instance.create_password_change_ticket(
        'password',
        result_url: 'http://myapp.com/callback',
        user_id: 'auth0|user',
        connection: 'conn',
        email: 'test@test.com')
    end
  end
end
