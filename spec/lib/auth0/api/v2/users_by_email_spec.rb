require 'spec_helper'
describe Auth0::Api::V2::UsersByEmail do
  before :all do
    dummy_instance = DummyClass.new
    dummy_instance.extend(Auth0::Api::V2::UsersByEmail)
    @instance = dummy_instance
  end

  context '.users_by_email' do
    it { expect(@instance).to respond_to(:users_by_email) }
    it 'is expected to call /api/v2/users-by-email' do
      expect(@instance).to receive(:get).with(
        '/api/v2/users-by-email',
        fields: nil,
        include_fields: nil,
        email: 'email'
      )
      expect { @instance.users_by_email('email') }.not_to raise_error
    end
  end
end
