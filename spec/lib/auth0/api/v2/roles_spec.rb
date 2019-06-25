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
  end

  context '.get_role' do
    it 'is expected to exist'  do
      expect(@instance).to respond_to(:get_role)
    end

    it 'is expected to have a role alias' do
      expect(@instance).to respond_to(:role)
    end

    it 'is expected to raise an exception if an empty role ID is passed' do
      expect(@instance).not_to receive(:get)
      expect do
        @instance.get_role('')
      end.to raise_exception Auth0::MissingParameter
    end
  end

  context '.create_role' do
    it 'is expected to exist'  do
      expect(@instance).to respond_to(:create_role)
    end

    it 'is expected to raise an exception if an empty role name is passed' do
      expect(@instance).not_to receive(:post)
      expect do
        @instance.create_role('')
      end.to raise_exception Auth0::MissingParameter
    end
  end

  context '.update_role' do
    it 'is expected to exist'  do
      expect(@instance).to respond_to(:update_role)
    end

    it 'is expected to raise an exception if an empty role ID is passed' do
      expect(@instance).not_to receive(:patch)
      expect do
        @instance.update_role('')
      end.to raise_exception Auth0::MissingParameter
    end
  end

  context '.delete_role' do
    it 'is expected to exist'  do
      expect(@instance).to respond_to(:delete_role)
    end

    it 'is expected to raise an exception if an empty role ID is passed' do
      expect(@instance).not_to receive(:delete)
      expect do
        @instance.delete_role('')
      end.to raise_exception Auth0::MissingParameter
    end
  end

  context '.get_users' do
    it 'is expected to exist'  do
      expect(@instance).to respond_to(:get_users)
    end

    it 'is expected to raise an exception if an empty role ID is passed' do
      expect(@instance).not_to receive(:get)
      expect do
        @instance.get_users('')
      end.to raise_exception Auth0::MissingParameter
    end
  end

  context '.add_users' do
    it 'is expected to exist'  do
      expect(@instance).to respond_to(:add_users)
    end

    it 'is expected to raise an exception if an empty role ID is passed' do
      expect(@instance).not_to receive(:post)
      expect do
        @instance.add_users('')
      end.to raise_exception Auth0::MissingParameter
    end

    it 'is expected to raise an exception if no user IDs are passed' do
      expect(@instance).not_to receive(:post)
      expect do
        @instance.add_users('ROLE_ID', [])
      end.to raise_exception Auth0::MissingParameter
    end
  end

  context '.get_permissions' do
    it 'is expected to exist'  do
      expect(@instance).to respond_to(:get_permissions)
    end

    it 'is expected to raise an exception if an empty role ID is passed' do
      expect(@instance).not_to receive(:get)
      expect do
        @instance.get_permissions('')
      end.to raise_exception Auth0::MissingParameter
    end
  end

  context '.add_permissions' do
    it 'is expected to exist'  do
      expect(@instance).to respond_to(:add_permissions)
    end

    it 'is expected to raise an exception if an empty role ID is passed' do
      expect(@instance).not_to receive(:post)
      expect do
        @instance.add_permissions('', [])
      end.to raise_exception Auth0::MissingParameter
    end

    it 'is expected to raise an exception if an array is not passed for permissions' do
      expect(@instance).not_to receive(:post)
      expect do
        @instance.add_permissions('USER_ID', 'PERMISSIONS')
      end.to raise_exception Auth0::InvalidParameter
    end

    it 'is expected to raise an exception if an empty permissions array is passed' do
      expect(@instance).not_to receive(:post)
      expect do
        @instance.add_permissions('USER_ID', [])
      end.to raise_exception Auth0::MissingParameter
    end

    it 'is expected to raise an exception if the permissions array does not contain Permission structs' do
      expect(@instance).not_to receive(:post)
      expect do
        @instance.add_permissions('USER_ID', [1, 2, 3])
      end.to raise_exception Auth0::InvalidParameter
    end
  end

  context '.remove_permissions' do
    it 'is expected to exist'  do
      expect(@instance).to respond_to(:remove_permissions)
    end

    it 'is expected to raise an exception if an empty role ID is passed' do
      expect(@instance).not_to receive(:delete)
      expect do
        @instance.remove_permissions('', [])
      end.to raise_exception Auth0::MissingParameter
    end

    it 'is expected to raise an exception if an array is not passed for permissions' do
      expect(@instance).not_to receive(:post)
      expect do
        @instance.remove_permissions('USER_ID', 'PERMISSIONS')
      end.to raise_exception Auth0::InvalidParameter
    end

    it 'is expected to raise an exception if an empty permissions array is passed' do
      expect(@instance).not_to receive(:delete)
      expect do
        @instance.remove_permissions('USER_ID', [])
      end.to raise_exception Auth0::MissingParameter
    end

    it 'is expected to raise an exception if the permissions array does not contain Permission structs' do
      expect(@instance).not_to receive(:post)
      expect do
        @instance.add_permissions('USER_ID', [1, 2, 3])
      end.to raise_exception Auth0::InvalidParameter
    end
  end
end