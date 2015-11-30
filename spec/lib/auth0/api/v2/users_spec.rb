require 'spec_helper'
describe Auth0::Api::V2::Users do
  before :all do
    dummy_instance = DummyClass.new
    dummy_instance.extend(Auth0::Api::V2::Users)
    @instance = dummy_instance
  end

  context '.users' do
    it { expect(@instance).to respond_to(:users) }
    it { expect(@instance).to respond_to(:get_users) }
    it 'is expected to call /api/v2/users' do
      expect(@instance).to receive(:get).with('/api/v2/users', per_page: nil, page: nil, include_totals: nil, sort: nil, connection: nil, fields: nil, q: nil)
      expect { @instance.users }.not_to raise_error
    end
  end

  context '.user' do
    it { expect(@instance).to respond_to(:user) }
    it 'is expected to call get request to /api/v2/users/USER_ID' do
      expect(@instance).to receive(:get).with('/api/v2/users/USER_ID', { fields: nil })
      expect { @instance.user('USER_ID') }.not_to raise_error
    end
  end

  context '.create_user' do
    it { expect(@instance).to respond_to(:create_user) }
    it 'is expected to call post to /api/v2/users' do
      expect(@instance).to receive(:post).with('/api/v2/users', email: 'test@test.com', password: 'password', connection: 'conn', name: 'name')
      @instance.create_user('name', email: 'test@test.com', password: 'password', connection: 'conn')
    end
  end

  context '.delete_users' do
    it { expect(@instance).to respond_to :delete_users }
    it 'is expected to call delete to /api/v2/users' do
      expect(@instance).to receive(:delete).with('/api/v2/users')
      @instance.delete_users
    end
  end

  context '.delete_user' do
    it { expect(@instance).to respond_to(:delete_user) }
    it 'is expected to call delete to /api/v2/users/userId' do
      expect(@instance).to receive(:delete).with('/api/v2/users/userId')
      @instance.delete_user('userId')
    end

    it 'is expected not to call delete to /api/v2/users if user_id is blank' do
      expect(@instance).not_to receive(:delete)
      expect { @instance.delete_user('') }.to raise_exception(Auth0::MissingUserId)
    end
  end

  context '.delete_user_provider' do
    it { expect(@instance).to respond_to(:delete_user_provider) }
    it 'is expected to call delete to /api/v2/users/userId/multifactor/provider' do
      expect(@instance).to receive(:delete).with('/api/v2/users/userId/multifactor/provider')
      @instance.delete_user_provider('userId', 'provider')
    end
  end

  context '.patch_user' do
    it { expect(@instance).to respond_to(:patch_user) }
    it 'is expected to call patch to /api/v2/users/userID' do
      expect(@instance).to receive(:patch).with('/api/v2/users/UserID', email: 'test@test.com', password: 'password', connection: 'conn', name: 'name')
      @instance.patch_user('UserID', email: 'test@test.com', password: 'password', connection: 'conn', name: 'name')
    end
  end
end
