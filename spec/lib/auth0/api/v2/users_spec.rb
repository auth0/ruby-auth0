require 'spec_helper'
describe Auth0::Api::V2::Users do
  before :all do
    dummy_instance = DummyClass.new
    dummy_instance.extend(Auth0::Api::V2::Users)
    @instance = dummy_instance
  end

  context '.users' do
    it 'is expected to respond to a users method' do
      expect(@instance).to respond_to(:users)
    end

    it 'is expected to respond to a get_users method' do
      expect(@instance).to respond_to(:get_users)
    end

    it 'is expected to get /api/v2/users' do
      expect(@instance).to receive(:get).with(
        '/api/v2/users',
        per_page: nil,
        page: nil,
        include_totals: nil,
        sort: nil,
        connection: nil,
        fields: nil,
        include_fields: nil,
        q: nil,
        search_engine: nil
      )
      expect { @instance.users }.not_to raise_error
    end

    it 'is expected to get /api/v2/users with custom parameters' do
      expect(@instance).to receive(:get).with(
        '/api/v2/users',
        per_page: 10,
        page: 1,
        include_totals: true,
        sort: nil,
        connection: 'auth0',
        fields: 'name,email',
        include_fields: nil,
        q: nil,
        search_engine: 'v3'
      )
      expect do
        @instance.users(
          search_engine: 'v3',
          per_page: 10,
          page: 1,
          include_totals: true,
          connection: 'auth0',
          fields: 'name,email'
        )
      end.not_to raise_error
    end
  end

  context '.user' do
    it 'is expected to respond to a user method' do
      expect(@instance).to respond_to(:user)
    end

    it 'is expected to call get request to /api/v2/users/USER_ID' do
      expect(@instance).to receive(:get).with(
        '/api/v2/users/USER_ID',
        fields: nil,
        include_fields: true
      )
      expect { @instance.user('USER_ID') }.not_to raise_error
    end

    it 'is expected to raise an exception when the user ID is empty' do
      expect { @instance.user(nil) }.to raise_exception(Auth0::MissingUserId)
    end
  end

  context '.create_user' do
    it 'is expected to respond to a create_user method' do
      expect(@instance).to respond_to(:create_user)
    end

    it 'is expected to post to /api/v2/users' do
      expect(@instance).to receive(:post).with(
        '/api/v2/users',
        email: 'test@test.com',
        password: 'password',
        connection: 'conn',
        name: 'name'
      )
      expect do
        @instance.create_user(
          'name',
          email: 'test@test.com',
          password: 'password',
          connection: 'conn'
        )
      end.not_to raise_error
    end
  end

  context '.delete_users' do
    it 'is expected to respond to a delete_users method' do
      expect(@instance).to respond_to :delete_users
    end

    it 'is expected to call delete to /api/v2/users' do
      expect(@instance).to receive(:delete).with('/api/v2/users')
      expect { @instance.delete_users }.not_to raise_error
    end
  end

  context '.delete_user' do
    it 'is expected to respond to a delete_user method' do
      expect(@instance).to respond_to(:delete_user)
    end

    it 'is expected to delete /api/v2/users/USER_ID' do
      expect(@instance).to receive(:delete).with('/api/v2/users/USER_ID')
      @instance.delete_user('USER_ID')
    end

    it 'is expected not to delete /api/v2/users if user_id is blank' do
      expect(@instance).not_to receive(:delete)
      expect { @instance.delete_user(nil) }.to raise_exception(
        Auth0::MissingUserId
      )
    end
  end

  context '.delete_user_provider' do
    it 'is expected to respond to a delete_user_provider method' do
      expect(@instance).to respond_to(:delete_user_provider)
    end

    it 'is expected to delete /api/v2/users/userId/multifactor/provider' do
      expect(@instance).to receive(:delete).with('/api/v2/users/USER_ID/multifactor/PROVIDER_NAME')
      @instance.delete_user_provider('USER_ID', 'PROVIDER_NAME')
    end

    it 'is expected to raise an exception when the user ID is empty' do
      expect { @instance.delete_user_provider(nil, 'PROVIDER_NAME') }.to raise_exception(Auth0::MissingUserId)
    end

    it 'is expected to raise an exception when the provider name is empty' do
      expect { @instance.delete_user_provider('USER_ID', nil) }.to raise_error 'Must supply a valid provider name'
    end
  end

  context '.patch_user' do
    it 'is expected to respond to a patch_user method' do
      expect(@instance).to respond_to(:patch_user)
    end

    it 'is expected to respond to a update_user method' do
      expect(@instance).to respond_to(:update_user)
    end

    it 'is expected to patch /api/v2/users/USER_ID' do
      expect(@instance).to receive(:patch).with(
        '/api/v2/users/USER_ID',
        email: 'test@test.com',
        password: 'password',
        connection: 'conn',
        name: 'name'
      )
      @instance.patch_user(
        'USER_ID',
        email: 'test@test.com',
        password: 'password',
        connection: 'conn',
        name: 'name'
      )
    end

    it 'is expected to raise an exception when the user ID is empty' do
      expect { @instance.patch_user(nil, 'BODY') }.to raise_exception(Auth0::MissingUserId)
    end

    it 'is expected to raise an error when the body is empty' do
      expect { @instance.patch_user('USER_ID', nil) }.to raise_error 'Must supply a valid body'
    end
  end

  context '.link_user_account' do
    it 'is expected to respond to a link_user_account method' do
      expect(@instance).to respond_to(:link_user_account)
    end

    it 'is expected to post to /api/v2/users/UserId/identities' do
      expect(@instance).to receive(:post).with('/api/v2/users/USER_ID/identities', body: 'json body')
      @instance.link_user_account('USER_ID', body: 'json body')
    end

    it 'is expected to raise an exception when the user ID is empty' do
      expect { @instance.link_user_account(nil, 'BODY') }.to raise_exception(Auth0::MissingUserId)
    end

    it 'is expected to raise an error when the body is empty' do
      expect { @instance.link_user_account('USER_ID', nil) }.to raise_error 'Must supply a valid body'
    end
  end

  context '.unlink_users_account' do
    it 'is expected to respond to a unlink_users_account method' do
      expect(@instance).to respond_to(:unlink_users_account)
    end

    it 'is expected to delete /api/v2/users/UserId/identities' do
      expect(@instance).to receive(:delete).with('/api/v2/users/USER_ID_1/identities/PROVIDER_NAME/USER_ID_2')
      @instance.unlink_users_account('USER_ID_1', 'PROVIDER_NAME', 'USER_ID_2')
    end

    it 'is expected to raise an exception when the user ID is empty' do
      expect do
        @instance.unlink_users_account(nil, 'PROVIDER_NAME', 'USER_ID_2')
      end.to raise_error 'Must supply a valid user_id'
    end

    it 'is expected to raise an exception when the provider is empty' do
      expect do
        @instance.unlink_users_account('USER_ID_1', nil, 'USER_ID_2')
      end.to raise_error 'Must supply a valid provider'
    end

    it 'is expected to raise an exception when the secondary user ID is empty' do
      expect do
        @instance.unlink_users_account('USER_ID_1', 'PROVIDER_NAME', nil)
      end.to raise_error 'Must supply a valid secondary user_id'
    end
  end

  context '.user_logs' do
    it 'is expected to respond to a user_logs method' do
      expect(@instance).to respond_to(:user_logs)
    end

    it 'is expected to respond to a get_user_log_events method' do
      expect(@instance).to respond_to(:get_user_log_events)
    end

    it 'is expected to get /api/v2/USER_ID/logs' do
      expect(@instance).to receive(:get).with(
        '/api/v2/users/USER_ID/logs',
        per_page: nil,
        page: nil,
        include_totals: nil,
        sort: nil
      )
      expect { @instance.user_logs('USER_ID') }.not_to raise_error
    end

    it 'is expected to raise an exception when the user ID is empty' do
      expect { @instance.user_logs(nil) }.to raise_exception(Auth0::MissingUserId)
    end

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

  context '.get_roles' do
    it 'is expected to respond to a get_roles method' do
      expect(@instance).to respond_to(:get_roles)
    end

    it 'is expected to raise an exception when the user ID is empty' do
      expect { @instance.get_roles(nil) }.to raise_exception(Auth0::MissingUserId)
    end

    it 'is expected to get roles with default parameters' do
      expect(@instance).to receive(:get).with(
        '/api/v2/users/USER_ID/roles',
        per_page: nil,
        page: nil,
        include_totals: nil
      )
      expect { @instance.get_roles('USER_ID') }.not_to raise_error
    end

    it 'is expected to get roles with custom parameters' do
      expect(@instance).to receive(:get).with(
        '/api/v2/users/USER_ID/roles',
        per_page: 20,
        page: 2,
        include_totals: true
      )
      expect do
        @instance.get_roles('USER_ID', per_page: 20, page: 2, include_totals: true)
      end.not_to raise_error
    end
  end

  context '.remove_roles' do
    it 'is expected to respond to a remove_roles method' do
      expect(@instance).to respond_to(:remove_roles)
    end

    it 'is expected to raise an exception when the user ID is empty' do
      expect { @instance.remove_roles(nil, 'ROLES') }.to raise_exception(Auth0::MissingUserId)
    end

    it 'is expected to raise an exception when the roles are not an array' do
      expect { @instance.remove_roles('USER_ID', 'ROLES') }.to raise_exception(Auth0::InvalidParameter)
    end

    it 'is expected to raise an exception when the roles are empty' do
      expect { @instance.remove_roles('USER_ID', []) }.to raise_exception(Auth0::MissingParameter)
    end

    it 'is expected to raise an exception when the roles are empty' do
      expect { @instance.remove_roles('USER_ID', [1, 2]) }.to raise_exception(Auth0::InvalidParameter)
    end

    it 'is expected to remove roles' do
      expect(@instance).to receive(:delete).with(
        '/api/v2/users/USER_ID/roles',
        roles: %w[test-role-01 test-role-02]
      )
      expect do
        @instance.remove_roles('USER_ID', %w[test-role-01 test-role-02])
      end.not_to raise_error
    end
  end

  context '.add_roles' do
    it 'is expected to respond to a add_roles method' do
      expect(@instance).to respond_to(:add_roles)
    end

    it 'is expected to raise an exception when the user ID is empty' do
      expect { @instance.add_roles(nil, 'ROLES') }.to raise_exception(Auth0::MissingUserId)
    end

    it 'is expected to raise an exception when the user ID is empty' do
      expect { @instance.add_roles('USER_ID', 'ROLES') }.to raise_exception(Auth0::InvalidParameter)
    end

    it 'is expected to raise an exception when the roles are empty' do
      expect { @instance.add_roles('USER_ID', [3, 4]) }.to raise_exception(Auth0::InvalidParameter)
    end

    it 'is expected to add roles' do
      expect(@instance).to receive(:post).with(
        '/api/v2/users/USER_ID/roles',
        roles: %w[test-role-03 test-role-04]
      )
      expect do
        @instance.add_roles('USER_ID', %w[test-role-03 test-role-04])
      end.not_to raise_error
    end
  end

  context '.get_enrollments' do
    it 'is expected to respond to a get_enrollments method' do
      expect(@instance).to respond_to(:get_enrollments)
    end

    it 'is expected to raise an exception when the user ID is empty' do
      expect { @instance.get_enrollments(nil) }.to raise_exception(Auth0::MissingUserId)
    end

    it 'is expected to get enrollments' do
      expect(@instance).to receive(:get).with('/api/v2/users/USER_ID/enrollments')
      expect do
        @instance.get_enrollments('USER_ID')
      end.not_to raise_error
    end
  end

  context '.get_permissions' do
    it 'is expected to respond to a get_permissions method' do
      expect(@instance).to respond_to(:get_permissions)
    end

    it 'is expected to raise an exception when the user ID is empty' do
      expect { @instance.get_permissions(nil) }.to raise_exception(Auth0::MissingUserId)
    end

    it 'is expected to get permissions' do
      expect(@instance).to receive(:get).with('/api/v2/users/USER_ID/permissions')
      expect do
        @instance.get_permissions('USER_ID')
      end.not_to raise_error
    end
  end

  context '.remove_permissions' do
    it 'is expected to respond to a remove_permissions method' do
      expect(@instance).to respond_to(:remove_permissions)
    end

    it 'is expected to raise an exception when the user ID is empty' do
      expect { @instance.remove_permissions(nil, 'PERMISSIONS') }.to raise_exception(Auth0::MissingUserId)
    end

    it 'is expected to raise an exception when the permissions are empty' do
      expect { @instance.remove_permissions('USER_ID', []) }.to raise_exception(Auth0::MissingParameter)
    end

    it 'is expected to raise an exception when the array does not consist of Permissions' do
      expect do
        @instance.remove_permissions('USER_ID', %w[permission-01 permission02])
      end.to raise_exception(Auth0::InvalidParameter)
    end

    it 'is expected to remove permissions' do
      expect(@instance).to receive(:delete).with(
        '/api/v2/users/USER_ID/permissions',
        permissions: [
          {
            permission_name: 'permission-name-1',
            resource_server_identifier: 'server-id-1'
          },
          {
            permission_name: 'permission-name-2',
            resource_server_identifier: 'server-id-2'
          }
        ]
      )
      expect do
        @instance.remove_permissions(
          'USER_ID',
          [
            Permission.new('permission-name-1', 'server-id-1'),
            Permission.new('permission-name-2', 'server-id-2')
          ]
        )
      end.not_to raise_error
    end
  end

  context '.add_permissions' do
    it 'is expected to respond to a add_permissions method' do
      expect(@instance).to respond_to(:add_permissions)
    end

    it 'is expected to raise an exception when the user ID is empty' do
      expect { @instance.add_permissions(nil, 'PERMISSIONS') }.to raise_exception(Auth0::MissingUserId)
    end

    it 'is expected to raise an exception when the permissions are empty' do
      expect { @instance.add_permissions('USER_ID', []) }.to raise_exception(Auth0::MissingParameter)
    end

    it 'is expected to raise an exception when the permissions are not Permission structs' do
      expect do
        @instance.add_permissions('USER_ID', %w[permission-01 permission02])
      end.to raise_exception(Auth0::InvalidParameter)
    end

    it 'is expected to add permissions' do
      expect(@instance).to receive(:post).with(
        '/api/v2/users/USER_ID/permissions',
        permissions: [
          {
            permission_name: 'permission-name-1',
            resource_server_identifier: 'server-id-1'
          },
          {
            permission_name: 'permission-name-2',
            resource_server_identifier: 'server-id-2'
          }
        ]
      )
      expect do
        @instance.add_permissions(
          'USER_ID',
          [
            Permission.new('permission-name-1', 'server-id-1'),
            Permission.new('permission-name-2', 'server-id-2')
          ]
        )
      end.not_to raise_error
    end
  end

  context '.generate_recovery_code' do
    it 'is expected to respond to a generate_recovery_code method' do
      expect(@instance).to respond_to(:generate_recovery_code)
    end

    it 'is expected to raise an exception when the user ID is empty' do
      expect { @instance.generate_recovery_code(nil) }.to raise_exception(Auth0::MissingUserId)
    end

    it 'is expected to get generate a recovery code' do
      expect(@instance).to receive(:post).with('/api/v2/users/USER_ID/recovery-code-generation')
      expect do
        @instance.generate_recovery_code('USER_ID')
      end.not_to raise_error
    end
  end

  context '.invalidate_browsers' do
    it 'is expected to respond to a invalidate_browsers method' do
      expect(@instance).to respond_to(:invalidate_browsers)
    end

    it 'is expected to raise an exception when the user ID is empty' do
      expect { @instance.invalidate_browsers(nil) }.to raise_exception(Auth0::MissingUserId)
    end

    it 'is expected to invalidate remembered browsers' do
      expect(@instance).to receive(:post).with(
        '/api/v2/users/USER_ID/multifactor/actions/invalidate-remember-browser'
      )
      expect do
        @instance.invalidate_browsers('USER_ID')
      end.not_to raise_error
    end
  end
end
