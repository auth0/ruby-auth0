require 'spec_helper'
require 'securerandom'

describe Auth0::Api::V1::Users do
  before :all do
    dummy_instance = DummyClass.new
    dummy_instance.extend(Auth0::Api::V1::Users)
    @instance = dummy_instance
  end

  context '.users' do
    it { expect(@instance).to respond_to(:users) }
    it { expect(@instance).to respond_to(:users_search) }
    it 'is expected to call /api/users when search is nill' do
      expect(@instance).to receive(:get).with('/api/users')
      expect { @instance.users }.not_to raise_error
    end

    it 'is expected to call /api/users?search=search_criteria when search is search_criteria' do
      expect(@instance).to receive(:get).with('/api/users?search=search_criteria')
      expect { @instance.users('search_criteria') }.not_to raise_error
    end
  end

  context '.user' do
    it { expect(@instance).to respond_to(:user) }
    it 'is expected to call get request to /api/users/USER_ID' do
      expect(@instance).to receive(:get).with('/api/users/USER_ID')
      expect { @instance.user('USER_ID') }.not_to raise_error
    end
  end

  context '.user_devices' do
    it { expect(@instance).to respond_to(:user_devices) }
    it 'is expected to call /api/users when search is nill' do
      expect(@instance).to receive(:get).with('/api/users/USER_ID/devices')
      expect { @instance.user_devices('USER_ID') }.not_to raise_error
    end
  end

  context '.connection_users' do
    it { expect(@instance).to respond_to(:connection_users) }
    it { expect(@instance).to respond_to(:search_connection_users) }
    it 'is expected to call /api/connections/CONNECTION_ID/users/ when search is nill' do
      expect(@instance).to receive(:get).with('/api/connections/CONNECTION_ID/users')
      expect { @instance.connection_users('CONNECTION_ID') }.not_to raise_error
    end

    it 'is expected to call
      /api/connections/CONNECTION_ID/users?search=search_criteria when search is search_criteria' do
      expect(@instance).to receive(:get).with('/api/connections/CONNECTION_ID/users?search=search_criteria')
      expect { @instance.connection_users('CONNECTION_ID', 'search_criteria') }.not_to raise_error
    end
  end

  context '.enterpriseconnections_users' do
    it { expect(@instance).to respond_to(:enterpriseconnections_users) }
    it 'is expected to call get to /api/enterpriseconnections/users' do
      expect(@instance).to receive(:get).with('/api/enterpriseconnections/users?search=arr a&per_page=11')
      @instance.enterpriseconnections_users 'arr a', 11
    end

    it 'is expected to call get to /api/enterpriseconnections/users?search=dfasdf&per_page=500' do
      expect(@instance).to receive(:get).with('/api/enterpriseconnections/users?search=arr a&per_page=500')
      @instance.enterpriseconnections_users 'arr a'
    end
  end

  context '.socialconnections_users' do
    it { expect(@instance).to respond_to(:socialconnections_users) }
    it 'is expected to call get to /api/socialconnections/users' do
      expect(@instance).to receive(:get).with('/api/socialconnections/users?search=arr a&per_page=11')
      @instance.socialconnections_users 'arr a', 11
    end
    it 'is expected to call get to /api/socialconnections/users' do
      expect(@instance).to receive(:get).with('/api/socialconnections/users?search=arr a&per_page=500')
      @instance.socialconnections_users 'arr a'
    end
    it 'is expected to call get to /api/socialconnections/users' do
      expect(@instance).to receive(:get).with('/api/socialconnections/users?search=&per_page=500')
      @instance.socialconnections_users
    end
  end

  context '.client_users' do
    it { expect(@instance).to respond_to(:client_users) }
    it 'is expected to call /api/client/test_client_id/users through get' do
      expect(@instance).to receive(:get).with('/api/clients/test_client_id/users')
      @instance.client_users('test_client_id')
    end
    it 'is expected to call /api/client//users if no client_id passed' do
      expect(@instance).to receive(:get).with("/api/clients/#{@instance.client_id}/users")
      expect { @instance.client_users }.not_to raise_error
    end
  end

  context '.create_user' do
    it { expect(@instance).to respond_to(:create_user) }
    it 'is expected to call post to /api/users' do
      expect(@instance).to receive(:post).with(
        '/api/users',
        email: 'test@test.com',
        password: 'password',
        connection: 'conn'
      )
      @instance.create_user('test@test.com', 'password', 'conn')
    end
  end

  context '.send_verification_email' do
    it { expect(@instance).to respond_to(:send_verification_email) }
    it 'is expected to call post to /api/users/test/send_verification_email' do
      expect(@instance).to receive(:post).with('/api/users/test/send_verification_email')
      @instance.send_verification_email('test')
    end
  end

  context '.change_password_ticket' do
    it { expect(@instance).to respond_to(:change_password_ticket) }
    it 'is expected to call post to /api/users/USERID/change_password_ticket' do
      password = SecureRandom.hex
      expect(@instance).to receive(:post).with(
        '/api/users/USERID/change_password_ticket',
        'newPassword' => password, 'resultUrl' => nil
      )
      @instance.change_password_ticket 'USERID', password
    end
  end

  context '.verification_ticket' do
    it { expect(@instance).to respond_to(:verification_ticket) }
    it 'is expected to call post to /api/users/userId/verification_ticket if resulturl is set' do
      expect(@instance).to receive(:post).with(
        '/api/users/auth0|tdasfasdfasdfa/verification_ticket',
        'resultUrl' => 'google.com'
      )
      @instance.verification_ticket('auth0|tdasfasdfasdfa', 'google.com')
    end
    it 'is expected to call post to /api/users/userId/verification_ticket
      if result url is empty' do
      expect(@instance).to receive(:post).with(
        '/api/users/auth0|tdasfasdfasdfa/verification_ticket',
        'resultUrl' => nil
      )
      @instance.verification_ticket('auth0|tdasfasdfasdfa')
    end
  end

  context '.create_public_key' do
    it { expect(@instance).to respond_to(:create_public_key) }
    it 'is expected to call post to /api/users/userId/public_key' do
      expect(@instance).to receive(:post).with(
        '/api/users/auth0|tdasfasdfasdfa/public_key',
        device: 'device22', public_key: 'SuperSecurePK'
      )
      @instance.create_public_key('auth0|tdasfasdfasdfa', 'device22', 'SuperSecurePK')
    end
  end

  context '.update_user_email' do
    it { expect(@instance).to respond_to(:update_user_email) }
    it 'is expected to call put to /api/users/auth0|tdasfasdfasdfa/email' do
      expect(@instance).to receive(:put).with('/api/users/auth0|tdasfasdfasdfa/email', email: 'email', verify: true)
      @instance.update_user_email('auth0|tdasfasdfasdfa', 'email')
    end
  end

  context '.update_user_metadata' do
    it { expect(@instance).to respond_to :update_user_metadata }
    it 'is expected to call put to /api/users/userId/metadata' do
      expect(@instance).to receive(:put).with('/api/users/userId/metadata', supersecret_users_data: '3')
      @instance.update_user_metadata 'userId', supersecret_users_data: '3'
    end
  end

  context '.update_user_password' do
    it { expect(@instance).to respond_to(:update_user_password) }
    it 'is expected to call put to /api/users/auth0|tdasfasdfasdfa/password' do
      expect(@instance).to receive(:put).with(
        '/api/users/auth0|tdasfasdfasdfa/password',
        password: 'password',
        verify: true
      )
      @instance.update_user_password('auth0|tdasfasdfasdfa', 'password')
    end
  end

  context '.update_user_password_using_email' do
    it { expect(@instance).to respond_to(:update_user_password_using_email) }
    it 'is expected to call put to /api/users/email@email.com/password' do
      expect(@instance).to receive(:put).with(
        '/api/users/email@email.com/password',
        email: 'email@email.com',
        password: 'password',
        connection: 'Con',
        verify: true
      )
      @instance.update_user_password_using_email(
        'email@email.com', 'password', 'Con'
      )
    end
  end

  context '.patch_user_metadata' do
    it { expect(@instance).to respond_to :patch_user_metadata }
    it 'is expected to call patch to /api/users/userId/metadata' do
      expect(@instance).to receive(:patch).with('/api/users/userId/metadata', supersecret_users_data: '3')
      @instance.patch_user_metadata 'userId', supersecret_users_data: '3'
    end
  end

  context '.delete_users' do
    it { expect(@instance).to respond_to :delete_users }
    it 'is expected to call delete to /api/users' do
      expect(@instance).to receive(:delete).with('/api/users/')
      @instance.delete_users
    end
  end

  context '.delete_user' do
    it { expect(@instance).to respond_to(:delete_user) }
    it 'is expected to call delete to /api/users/userId' do
      expect(@instance).to receive(:delete).with('/api/users/userId')
      @instance.delete_user('userId')
    end

    it 'is expected not to call delete to /api/users if user_id is blank' do
      expect(@instance).not_to receive(:delete)
      expect { @instance.delete_user('') }.to raise_exception(Auth0::MissingUserId)
    end
  end

  context '.revoke_user_refresh_token' do
    it { expect(@instance).to respond_to(:revoke_user_refresh_token) }
    it 'is expected to call delete to /api/users/user_id/refresh_tokens/refresh_token' do
      expect(@instance).to receive(:delete).with('/api/users/user_id/refresh_tokens/refresh_token')
      @instance.revoke_user_refresh_token('user_id', 'refresh_token')
    end
  end

  context '.revoke_user_device_public_key' do
    it { expect(@instance).to respond_to(:revoke_user_device_public_key) }
    it 'is expected to call delete to /api/users/user_id/publickey?device=device' do
      expect(@instance).to receive(:delete).with('/api/users/user_id/publickey?device=device')
      @instance.revoke_user_device_public_key('user_id', 'device')
    end
  end
end
