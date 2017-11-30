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
      expect(@instance).to receive(:get).with(
        '/api/v2/users',
        per_page: nil,
        page: nil,
        include_totals: nil,
        sort: nil,
        connection: nil,
        fields: nil,
        include_fields: nil,
        q: nil
      )
      expect { @instance.users }.not_to raise_error
    end
  end

  context '.user' do
    it { expect(@instance).to respond_to(:user) }
    it 'is expected to call get request to /api/v2/users/USER_ID' do
      expect(@instance).to receive(:get).with('/api/v2/users/USER_ID', fields: nil, include_fields: true)
      expect { @instance.user('USER_ID') }.not_to raise_error
    end
    it { expect { @instance.user('') }.to raise_error 'Must supply a valid user_id' }
  end

  context '.create_user' do
    it { expect(@instance).to respond_to(:create_user) }
    it 'is expected to call post to /api/v2/users' do
      expect(@instance).to receive(:post).with(
        '/api/v2/users',
        email: 'test@test.com',
        password: 'password',
        connection: 'conn',
        name: 'name'
      )
      @instance.create_user(
        'name',
        email: 'test@test.com',
        password: 'password',
        connection: 'conn'
      )
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
      expect { @instance.delete_user('') }.to raise_exception(
        Auth0::MissingUserId
      )
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
      expect(@instance).to receive(:patch).with(
        '/api/v2/users/UserID',
        email: 'test@test.com',
        password: 'password',
        connection: 'conn',
        name: 'name'
      )
      @instance.patch_user(
        'UserID',
        email: 'test@test.com',
        password: 'password',
        connection: 'conn',
        name: 'name'
      )
    end
    it { expect { @instance.patch_user('', 'body') }.to raise_error 'Must supply a valid user_id' }
    it { expect { @instance.patch_user('UserId', '') }.to raise_error 'Must supply a valid body' }
  end

  context '.link_user_account' do
    it { expect(@instance).to respond_to(:link_user_account) }
    it 'is expected to call post to /api/v2/users/UserId/identities' do
      expect(@instance).to receive(:post).with('/api/v2/users/UserID/identities', body: 'json body')
      @instance.link_user_account('UserID', body: 'json body')
    end
    it { expect { @instance.link_user_account('', 'body') }.to raise_error 'Must supply a valid user_id' }
    it { expect { @instance.link_user_account('UserId', '') }.to raise_error 'Must supply a valid body' }
  end

  context '.unlink_users_account' do
    it { expect(@instance).to respond_to(:unlink_users_account) }
    it 'is expected to call delete to /api/v2/users/UserId/identities' do
      expect(@instance).to receive(:delete).with('/api/v2/users/UserID/identities/provider_name/Secondary_User_ID')
      @instance.unlink_users_account('UserID', 'provider_name', 'Secondary_User_ID')
    end
    it { expect { @instance.unlink_users_account('', 'pro', 'SUserID') }.to raise_error 'Must supply a valid user_id' }
    it { expect { @instance.unlink_users_account('UID', nil, 'SUID') }.to raise_error 'Must supply a valid provider' }
    it do
      expect { @instance.unlink_users_account('UID', 'pro', nil) }.to raise_error 'Must supply a valid secondary user_id'
    end
  end

  context '.delete_user_provider' do
    it { expect(@instance).to respond_to(:delete_user_provider) }
    it 'is expected to call delete to /api/v2/users/User_ID/multifactor/provider_name' do
      expect(@instance).to receive(:delete).with('/api/v2/users/User_ID/multifactor/provider_name')
      @instance.delete_user_provider('User_ID', 'provider_name')
    end
    it { expect { @instance.delete_user_provider(nil, 'test') }.to raise_error 'Must supply a valid user_id' }
  end

  context '.user_logs' do
    it { expect(@instance).to respond_to(:user_logs) }
    it { expect(@instance).to respond_to(:get_user_log_events) }
    it 'is expected to call /api/v2/USER_ID/logs' do
      expect(@instance).to receive(:get).with(
        '/api/v2/users/USER_ID/logs',
        user_id: 'USER_ID',
        per_page: nil,
        page: nil,
        include_totals: nil,
        sort: nil
      )
      expect { @instance.user_logs('USER_ID') }.not_to raise_error
    end
    it { expect { @instance.user_logs('') }.to raise_error 'Must supply a valid user_id' }
    it 'is expected to raise an error when per_page is higher than 100' do
      expect { @instance.user_logs('USER_ID', per_page: rand(101..2000)) }.to raise_error(
        'The total amount of entries per page should be less than 100'
      )
    end
    it 'is expected to raise an error when sort does not match pattern' do
      expect { @instance.user_logs('USER_ID', sort: 'no match') }.to raise_error(
        'Sort does not match pattern ^(([a-zA-Z0-9_\\.]+))\\:(1|-1)$'
      )
    end
  end
end
