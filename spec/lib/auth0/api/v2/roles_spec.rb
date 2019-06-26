require 'spec_helper'
describe Auth0::Api::V2::Roles do
  before :all do
    dummy_instance = DummyClass.new
    dummy_instance.extend(Auth0::Api::V2::Roles)
    @instance = dummy_instance
  end

  context '.get_roles' do
    it 'is expected to exist' do
      expect(@instance).to respond_to(:get_roles)
    end

    it 'is expected to have a roles alias' do
      expect(@instance).to respond_to(:roles)
    end

    it 'is expected to get Roles with default parameters' do
      expect(@instance).to receive(:get).with(
        '/api/v2/roles',
        per_page: nil,
        page: nil,
        include_totals: nil
      )
      expect { @instance.get_roles }.not_to raise_error
    end

    it 'is expected to get Roles with custom parameters' do
      expect(@instance).to receive(:get).with(
        '/api/v2/roles',
        per_page: 10,
        page: 3,
        include_totals: true
      )
      expect do
        @instance.get_roles(per_page: 10, page: 3, include_totals: true)
      end.not_to raise_error
    end
  end

  context '.get_role' do
    it 'is expected to exist' do
      expect(@instance).to respond_to(:get_role)
    end

    it 'is expected to have a role alias' do
      expect(@instance).to respond_to(:role)
    end

    it 'is expected to raise an exception if an empty Role ID is passed' do
      expect(@instance).not_to receive(:get)
      expect do
        @instance.get_role('')
      end.to raise_exception Auth0::MissingParameter
    end

    it 'is expected to get a Role by ID' do
      expect(@instance).to receive(:get).with('/api/v2/roles/ROLE_ID')
      expect { @instance.get_role('ROLE_ID') }.not_to raise_error
    end
  end

  context '.create_role' do
    it 'is expected to exist' do
      expect(@instance).to respond_to(:create_role)
    end

    it 'is expected to raise an exception if an empty Role name is passed' do
      expect(@instance).not_to receive(:post)
      expect do
        @instance.create_role('')
      end.to raise_exception Auth0::MissingParameter
    end

    it 'is expected to post a new Role' do
      expect(@instance).to receive(:post).with(
        '/api/v2/roles',
        name: 'ROLE_NAME',
        description: 'ROLE_DESCRIPTION'
      )
      expect do
        @instance.create_role(
          'ROLE_NAME',
          description: 'ROLE_DESCRIPTION'
        )
      end.not_to raise_error
    end
  end

  context '.update_role' do
    it 'is expected to exist' do
      expect(@instance).to respond_to(:update_role)
    end

    it 'is expected to raise an exception if an empty Role ID is passed' do
      expect(@instance).not_to receive(:patch)
      expect do
        @instance.update_role('')
      end.to raise_exception Auth0::MissingParameter
    end

    it 'is expected to post an updated Role' do
      expect(@instance).to receive(:patch).with(
        '/api/v2/roles/ROLE_ID',
        name: 'ROLE_NAME',
        description: 'ROLE_DESCRIPTION'
      )
      expect do
        @instance.update_role(
          'ROLE_ID',
          name: 'ROLE_NAME',
          description: 'ROLE_DESCRIPTION'
        )
      end.not_to raise_error
    end
  end

  context '.delete_role' do
    it 'is expected to exist' do
      expect(@instance).to respond_to(:delete_role)
    end

    it 'is expected to raise an exception if an empty Role ID is passed' do
      expect(@instance).not_to receive(:delete)
      expect do
        @instance.delete_role('')
      end.to raise_exception Auth0::MissingParameter
    end

    it 'is expected to delete a Role' do
      expect(@instance).to receive(:delete).with('/api/v2/roles/ROLE_ID')
      expect { @instance.delete_role('ROLE_ID') }.not_to raise_error
    end
  end

  context '.get_users' do
    it 'is expected to exist' do
      expect(@instance).to respond_to(:get_users)
    end

    it 'is expected to raise an exception if an empty Role ID is passed' do
      expect(@instance).not_to receive(:get)
      expect do
        @instance.get_users('')
      end.to raise_exception Auth0::MissingParameter
    end

    it 'is expected to get Users for a Role with default parameters' do
      expect(@instance).to receive(:get).with(
        '/api/v2/roles/ROLE_ID/users',
        per_page: nil,
        page: nil,
        include_totals: nil
      )
      expect { @instance.get_users('ROLE_ID') }.not_to raise_error
    end

    it 'is expected to get Users for a Role with custom parameters' do
      expect(@instance).to receive(:get).with(
        '/api/v2/roles/ROLE_ID/users',
        per_page: 30,
        page: 4,
        include_totals: true
      )
      expect do
        @instance.get_users('ROLE_ID', per_page: 30, page: 4, include_totals: true)
      end.not_to raise_error
    end
  end

  context '.add_users' do
    it 'is expected to exist' do
      expect(@instance).to respond_to(:add_users)
    end

    it 'is expected to raise an exception if an empty Role ID is passed' do
      expect(@instance).not_to receive(:post)
      expect do
        @instance.add_users('', [])
      end.to raise_exception Auth0::MissingParameter
    end

    it 'is expected to raise an exception if an array is not passed for Users' do
      expect(@instance).not_to receive(:post)
      expect do
        @instance.add_users('ROLE_ID', 'USERS')
      end.to raise_exception Auth0::InvalidParameter
    end

    it 'is expected to raise an exception if no User IDs are passed' do
      expect(@instance).not_to receive(:post)
      expect do
        @instance.add_users('ROLE_ID', [])
      end.to raise_exception Auth0::MissingParameter
    end

    it 'is expected to add Users to a Role' do
      expect(@instance).to receive(:post).with(
        '/api/v2/roles/ROLE_ID/users',
        users: %w[test|user-01 test|user-02]
      )
      expect do
        @instance.add_users('ROLE_ID', %w[test|user-01 test|user-02])
      end.not_to raise_error
    end
  end

  context '.get_permissions' do
    it 'is expected to exist' do
      expect(@instance).to respond_to(:get_permissions)
    end

    it 'is expected to raise an exception if an empty Role ID is passed' do
      expect(@instance).not_to receive(:get)
      expect do
        @instance.get_permissions('')
      end.to raise_exception Auth0::MissingParameter
    end

    it 'is expected to get Roles with default parameters' do
      expect(@instance).to receive(:get).with(
        '/api/v2/roles/ROLE_ID/permissions',
        per_page: nil,
        page: nil,
        include_totals: nil
      )
      expect { @instance.get_permissions('ROLE_ID') }.not_to raise_error
    end

    it 'is expected to get Roles with custom parameters' do
      expect(@instance).to receive(:get).with(
        '/api/v2/roles/ROLE_ID/permissions',
        per_page: 15,
        page: 5,
        include_totals: true
      )
      expect do
        @instance.get_permissions('ROLE_ID', per_page: 15, page: 5, include_totals: true)
      end.not_to raise_error
    end
  end

  context '.add_permissions' do
    it 'is expected to exist' do
      expect(@instance).to respond_to(:add_permissions)
    end

    it 'is expected to raise an exception if an empty Role ID is passed' do
      expect(@instance).not_to receive(:post)
      expect do
        @instance.add_permissions('', [])
      end.to raise_exception Auth0::MissingParameter
    end

    it 'is expected to raise an exception if an array is not passed for permissions' do
      expect(@instance).not_to receive(:post)
      expect do
        @instance.add_permissions('ROLE_ID', 'PERMISSIONS')
      end.to raise_exception Auth0::InvalidParameter
    end

    it 'is expected to raise an exception if an empty permissions array is passed' do
      expect(@instance).not_to receive(:post)
      expect do
        @instance.add_permissions('ROLE_ID', [])
      end.to raise_exception Auth0::MissingParameter
    end

    it 'is expected to raise an exception if the permissions array does not contain Permission structs' do
      expect(@instance).not_to receive(:post)
      expect do
        @instance.add_permissions('ROLE_ID', [1, 2, 3])
      end.to raise_exception Auth0::InvalidParameter
    end

    it 'is expected to add permissions to a Role' do
      expect(@instance).to receive(:post).with(
        '/api/v2/roles/ROLE_ID/permissions',
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
          'ROLE_ID',
          [
            Permission.new('permission-name-1', 'server-id-1'),
            Permission.new('permission-name-2', 'server-id-2')
          ]
        )
      end.not_to raise_error
    end
  end

  context '.remove_permissions' do
    it 'is expected to exist' do
      expect(@instance).to respond_to(:remove_permissions)
    end

    it 'is expected to raise an exception if an empty Role ID is passed' do
      expect(@instance).not_to receive(:delete)
      expect do
        @instance.remove_permissions('', [])
      end.to raise_exception Auth0::MissingParameter
    end

    it 'is expected to raise an exception if an array is not passed for permissions' do
      expect(@instance).not_to receive(:post)
      expect do
        @instance.remove_permissions('ROLE_ID', 'PERMISSIONS')
      end.to raise_exception Auth0::InvalidParameter
    end

    it 'is expected to raise an exception if an empty permissions array is passed' do
      expect(@instance).not_to receive(:delete)
      expect do
        @instance.remove_permissions('ROLE_ID', [])
      end.to raise_exception Auth0::MissingParameter
    end

    it 'is expected to raise an exception if the permissions array does not contain Permission structs' do
      expect(@instance).not_to receive(:post)
      expect do
        @instance.remove_permissions('ROLE_ID', [1, 2, 3])
      end.to raise_exception Auth0::InvalidParameter
    end

    it 'is expected to remove permissions from a Role' do
      expect(@instance).to receive(:delete).with(
        '/api/v2/roles/ROLE_ID/permissions',
        permissions: [
          {
            permission_name: 'permission-name-3',
            resource_server_identifier: 'server-id-3'
          },
          {
            permission_name: 'permission-name-4',
            resource_server_identifier: 'server-id-4'
          }
        ]
      )
      expect do
        @instance.remove_permissions(
          'ROLE_ID',
          [
            Permission.new('permission-name-3', 'server-id-3'),
            Permission.new('permission-name-4', 'server-id-4')
          ]
        )
      end.not_to raise_error
    end
  end
end
