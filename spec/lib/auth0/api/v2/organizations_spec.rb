require 'spec_helper'
describe Auth0::Api::V2::Organizations do
  before :all do
    dummy_instance = DummyClass.new
    dummy_instance.extend(Auth0::Api::V2::Organizations)
    @instance = dummy_instance
  end

  context '.organizations' do
    it 'is expected to respond to a organizations method' do
      expect(@instance).to respond_to(:organizations)
    end

    it 'is expected to respond to a get_organizations method' do
      expect(@instance).to respond_to(:get_organizations)
    end

    it 'is expected to get /api/v2/organizations' do
      expect(@instance).to receive(:get).with(
        '/api/v2/organizations',
        per_page: nil,
        page: nil,
        from: nil,
        take: nil,
        include_totals: nil
      )
      expect { @instance.organizations }.not_to raise_error
    end

    it 'is expected to get /api/v2/organizations with custom parameters' do
      expect(@instance).to receive(:get).with(
        '/api/v2/organizations',
        per_page: 10,
        page: 1,
        from: 'org_id',
        take: 50,
        include_totals: true
      )
      expect do
        @instance.organizations(
          per_page: 10,
          page: 1,
          from: 'org_id',
          take: 50,
          include_totals: true
        )
      end.not_to raise_error
    end
  end

  context '.organization' do
    it 'is expected to respond to a user method' do
      expect(@instance).to respond_to(:organization)
    end

    it 'is expected to call get request to /api/v2/users/org_id' do
      expect(@instance).to receive(:get).with(
        '/api/v2/organizations/org_id'
      )
      expect { @instance.organization('org_id') }.not_to raise_error
    end

    it 'is expected to raise an exception when the organization ID is empty' do
      expect { @instance.organization(nil) }.to raise_exception(Auth0::MissingOrganizationId)
    end
  end

  context '.create_organization' do
    it 'is expected to respond to a create_organization method' do
      expect(@instance).to respond_to(:create_organization)
    end

    it 'is expected to post to /api/v2/organizations' do
      expect(@instance).to receive(:post).with(
        '/api/v2/organizations',
          name: 'test_org'
        )
      expect do
        @instance.create_organization(
          name: 'test_org'
        )
      end.not_to raise_error
    end
  end

  context '.delete_organization' do
    it 'is expected to respond to a delete_organization method' do
      expect(@instance).to respond_to :delete_organization
    end

    it 'is expected to call delete to /api/v2/organizations/org_id' do
      expect(@instance).to receive(:delete).with('/api/v2/organizations/org_id')
      expect { @instance.delete_organization('org_id') }.not_to raise_error
    end

    it 'is expected not to delete /api/v2/organizations if organization_id is blank' do
      expect(@instance).not_to receive(:delete)
      expect { @instance.delete_organization(nil) }.to raise_exception(
        Auth0::MissingOrganizationId
      )
    end
  end

  context '.organization_by_name' do
    it 'is expected to respond to a user method' do
      expect(@instance).to respond_to(:organization_by_name)
    end

    it 'is expected to call get request to /api/v2/users/org_id' do
      expect(@instance).to receive(:get).with(
        '/api/v2/organizations/name/org_id'
      )
      expect { @instance.organization_by_name('org_id') }.not_to raise_error
    end

    it 'is expected to raise an exception when the organization ID is empty' do
      expect { @instance.organization_by_name(nil) }.to raise_exception(Auth0::InvalidParameter)
    end
  end


  context '.patch_organization' do
    it 'is expected to respond to a patch_organization method' do
      expect(@instance).to respond_to(:patch_organization)
    end

    it 'is expected to respond to a update_organization method' do
      expect(@instance).to respond_to(:update_organization)
    end

    it 'is expected to patch /api/v2/organizations/org_id' do
      expect(@instance).to receive(:patch).with(
        '/api/v2/organizations/org_id',
        name: 'name'
      )
      @instance.patch_organization(
        'org_id',
        name: 'name'
      )
    end

    it 'is expected to raise an exception when the organization id is empty' do
      expect { @instance.patch_organization(nil, 'BODY') }.to raise_exception(Auth0::MissingOrganizationId)
    end

    it 'is expected to raise an error when the body is empty' do
      expect { @instance.patch_organization('org_id', nil) }.to raise_error 'Must supply a valid body'
    end
  end

  context '.get_organizations_enabled_connections' do
    it 'is expected to respond to a get_organizations_enabled_connections method' do
      expect(@instance).to respond_to(:get_organizations_enabled_connections)
    end

    it 'is expected to raise an exception when the org ID is empty' do
      expect { @instance.get_organizations_enabled_connections(nil) }.to raise_exception(Auth0::MissingOrganizationId)
    end

    it 'is expected to get enabled_connections for an org' do
      expect(@instance).to receive(:get).with(
        '/api/v2/organizations/org_id/enabled_connections'
      )
      expect { @instance.get_organizations_enabled_connections('org_id') }.not_to raise_error
    end

    it 'is expected to get enabled_connections for an org' do
      expect(@instance).to receive(:get).with(
        '/api/v2/organizations/org_id/enabled_connections'
      )
      expect do
        @instance.get_organizations_enabled_connections('org_id')
      end.not_to raise_error
    end
  end

  context '.get_organizations_enabled_connection' do
    it 'is expected to respond to a get_organizations_enabled_connection method' do
      expect(@instance).to respond_to(:get_organizations_enabled_connection)
    end

    it 'is expected to raise an exception when the org ID is empty' do
      expect { @instance.get_organizations_enabled_connection(nil, nil) }.to raise_exception(Auth0::MissingOrganizationId)
    end

    it 'is expected to raise an exception when the org ID is empty' do
      expect { @instance.get_organizations_enabled_connection('org_id', nil) }.to raise_exception(Auth0::InvalidParameter)
    end

    it 'is expected to get enabled connection for an org' do
      expect(@instance).to receive(:get).with(
        '/api/v2/organizations/org_id/enabled_connections/connection_id'
      )
      expect { @instance.get_organizations_enabled_connection('org_id', 'connection_id') }.not_to raise_error
    end

    it 'is expected to get enabled connection for an org' do
      expect(@instance).to receive(:get).with(
        '/api/v2/organizations/org_id/enabled_connections/connection_id'
      )
      expect do
        @instance.get_organizations_enabled_connection('org_id', 'connection_id')
      end.not_to raise_error
    end
  end

  context '.patch_organizations_enabled_connection' do
    it 'is expected to respond to a patch_organizations_enabled_connection method' do
      expect(@instance).to respond_to(:patch_organizations_enabled_connection)
    end

    it 'is expected to respond to a update_organizations_enabled_connection method' do
      expect(@instance).to respond_to(:update_organizations_enabled_connection)
    end

    it 'is expected to patch /api/v2/organizations/org_id/enabled_connections/connection_id' do
      expect(@instance).to receive(:patch).with(
        '/api/v2/organizations/org_id/enabled_connections/connection_id',
        {
          assign_membership_on_login: false
        }
      )
      @instance.patch_organizations_enabled_connection(
        'org_id',
        'connection_id',
        assign_membership_on_login: false
      )
    end

    it 'is expected to raise an exception when the organization id is empty' do
      expect { @instance.patch_organizations_enabled_connection(nil, 'BODY') }.to raise_exception(Auth0::MissingOrganizationId)
    end

    it 'is expected to raise an error when the connection_id is empty' do
      expect { @instance.patch_organizations_enabled_connection('org_id', nil) }.to raise_error 'Must supply a valid connection id'
    end

    it 'is expected to raise an error when assign_membership_on_login is nil' do
      expect { @instance.patch_organizations_enabled_connection('org_id', 'connection_id') }.to raise_error 'Must supply a valid assign_membership_on_login value'
    end
  end

  context '.create_organizations_enabled_connection' do
    it 'is expected to respond to a create_organizations_enabled_connection method' do
      expect(@instance).to respond_to(:create_organizations_enabled_connection)
    end

    it 'is expected to respond to a add_organizations_enabled_connection method' do
      expect(@instance).to respond_to(:add_organizations_enabled_connection)
    end

    it 'is expected to post /api/v2/organizations/org_id/enabled_connections' do
      expect(@instance).to receive(:post).with(
        '/api/v2/organizations/org_id/enabled_connections',
        {
          connection_id: 'connection_id',
          assign_membership_on_login: true
        }
      )
      @instance.create_organizations_enabled_connection('org_id', 'connection_id', assign_membership_on_login: true)
    end

    it 'is expected to raise an exception when the organization id is empty' do
      expect { @instance.create_organizations_enabled_connection(nil, nil) }.to raise_exception(Auth0::MissingOrganizationId)
    end

    it 'is expected to raise an exception when the connection id is empty' do
      expect { @instance.create_organizations_enabled_connection('123', nil) }.to raise_error 'Must supply a valid connection id'
    end
  end

  context '.delete_organizations_enabled_connection' do
    it 'is expected to respond to a delete_organizations_enabled_connection method' do
      expect(@instance).to respond_to(:delete_organizations_enabled_connection)
    end

    it 'is expected to respond to a remove_organizations_enabled_connection method' do
      expect(@instance).to respond_to(:remove_organizations_enabled_connection)
    end

    it 'is expected to delete /api/v2/organizations/org_id/enabled_connections/connection_id' do
      expect(@instance).to receive(:delete).with(
        '/api/v2/organizations/org_id/enabled_connections/connection_id'
      )
      @instance.delete_organizations_enabled_connection('org_id', 'connection_id')
    end

    it 'is expected to raise an exception when the organization id is empty' do
      expect { @instance.delete_organizations_enabled_connection(nil, nil) }.to raise_exception(Auth0::MissingOrganizationId)
    end
    
    it 'is expected to raise an exception when the connection id is empty' do
      expect { @instance.delete_organizations_enabled_connection('org_id', nil) }.to raise_error 'Must supply a valid connection id'
    end
  end

  context '.get_organizations_invites' do
    it 'is expected to respond to a get_organizations_invites method' do
      expect(@instance).to respond_to(:get_organizations_invites)
    end

    it 'is expected to raise an exception when the org ID is empty' do
      expect { @instance.get_organizations_invites(nil) }.to raise_exception(Auth0::MissingOrganizationId)
    end

    it 'is expected to get invitations for an org' do
      expect(@instance).to receive(:get).with(
        '/api/v2/organizations/org_id/invitations'
      )
      expect { @instance.get_organizations_invites('org_id') }.not_to raise_error
    end

    it 'is expected to get invitations for an org' do
      expect(@instance).to receive(:get).with(
        '/api/v2/organizations/org_id/invitations'
      )
      expect do
        @instance.get_organizations_invites('org_id')
      end.not_to raise_error
    end
  end

  context '.get_organizations_invite' do
    it 'is expected to respond to a get_organizations_invite method' do
      expect(@instance).to respond_to(:get_organizations_invite)
    end

    it 'is expected to raise an exception when the org ID is empty' do
      expect { @instance.get_organizations_invite(nil, nil) }.to raise_exception(Auth0::MissingOrganizationId)
    end

    it 'is expected to raise an exception when the org ID is empty' do
      expect { @instance.get_organizations_invite('org_id', nil) }.to raise_exception(Auth0::InvalidParameter)
    end

    it 'is expected to get enabled connection for an org' do
      expect(@instance).to receive(:get).with(
        '/api/v2/organizations/org_id/invitations/invite_id'
      )
      expect { @instance.get_organizations_invite('org_id', 'invite_id') }.not_to raise_error
    end

    it 'is expected to get enabled connection for an org' do
      expect(@instance).to receive(:get).with(
        '/api/v2/organizations/org_id/invitations/invite_id'
      )
      expect do
        @instance.get_organizations_invite('org_id', 'invite_id')
      end.not_to raise_error
    end
  end

  context '.patch_organizations_enabled_connection' do
    it 'is expected to respond to a patch_organizations_enabled_connection method' do
      expect(@instance).to respond_to(:patch_organizations_enabled_connection)
    end

    it 'is expected to respond to a update_organizations_enabled_connection method' do
      expect(@instance).to respond_to(:update_organizations_enabled_connection)
    end

    it 'is expected to patch /api/v2/organizations/org_id/enabled_connections/connection_id' do
      expect(@instance).to receive(:patch).with(
        '/api/v2/organizations/org_id/enabled_connections/connection_id',
        {
          assign_membership_on_login: false
        }
      )
      @instance.patch_organizations_enabled_connection(
        'org_id',
        'connection_id',
        assign_membership_on_login: false
      )
    end

    it 'is expected to raise an exception when the organization id is empty' do
      expect { @instance.patch_organizations_enabled_connection(nil, 'BODY') }.to raise_exception(Auth0::MissingOrganizationId)
    end

    it 'is expected to raise an error when the connection_id is empty' do
      expect { @instance.patch_organizations_enabled_connection('org_id', nil) }.to raise_error 'Must supply a valid connection id'
    end

    it 'is expected to raise an error when assign_membership_on_login is nil' do
      expect { @instance.patch_organizations_enabled_connection('org_id', 'connection_id') }.to raise_error 'Must supply a valid assign_membership_on_login value'
    end
  end

  context '.create_organizations_invite' do
    it 'is expected to respond to a create_organizations_invite method' do
      expect(@instance).to respond_to(:create_organizations_invite)
    end

    it 'is expected to respond to a add_organizations_invite method' do
      expect(@instance).to respond_to(:add_organizations_invite)
    end

    it 'is expected to post /api/v2/organizations/org_id/invitations' do
      expect(@instance).to receive(:post).with(
        '/api/v2/organizations/org_id/invitations',
        {
          ttl_sec: 60000
        }
      )
      @instance.create_organizations_invite('org_id', ttl_sec: 60000)
    end

    it 'is expected to raise an exception when the organization id is empty' do
      expect { @instance.create_organizations_invite(nil) }.to raise_exception(Auth0::MissingOrganizationId)
    end
  end

  context '.delete_organizations_invite' do
    it 'is expected to respond to a delete_organizations_invite method' do
      expect(@instance).to respond_to(:delete_organizations_invite)
    end

    it 'is expected to respond to a remove_organizations_invite method' do
      expect(@instance).to respond_to(:remove_organizations_invite)
    end

    it 'is expected to delete /api/v2/organizations/org_id/invitations/invite_id' do
      expect(@instance).to receive(:delete).with(
        '/api/v2/organizations/org_id/invitations/invite_id'
      )
      @instance.delete_organizations_invite('org_id', 'invite_id')
    end

    it 'is expected to raise an exception when the organization id is empty' do
      expect { @instance.delete_organizations_invite(nil, nil) }.to raise_exception(Auth0::MissingOrganizationId)
    end
    
    it 'is expected to raise an exception when the invitation id is empty' do
      expect { @instance.delete_organizations_invite('org_id', nil) }.to raise_error 'Must supply a valid invitation id'
    end
  end

  context '.get_organizations_members' do
    it 'is expected to respond to a get_organizations_members method' do
      expect(@instance).to respond_to(:get_organizations_members)
    end

    it 'is expected to raise an exception when the org ID is empty' do
      expect { @instance.get_organizations_members(nil) }.to raise_exception(Auth0::MissingOrganizationId)
    end

    it 'is expected to get members for an org' do
      expect(@instance).to receive(:get).with(
        '/api/v2/organizations/org_id/members',
        per_page: nil,
        page: nil,
        from: nil,
        take: nil,
        include_totals: nil
      )
      expect do
        @instance.get_organizations_members('org_id')
      end.not_to raise_error
    end

    it 'is expected to get /api/v2/organizations with custom parameters' do
      expect(@instance).to receive(:get).with(
        '/api/v2/organizations/org_id/members',
        per_page: 10,
        page: 1,
        from: 'org_id',
        take: 50,
        include_totals: true
      )
      expect do
        @instance.get_organizations_members(
          'org_id',
          per_page: 10,
          page: 1,
          from: 'org_id',
          take: 50,
          include_totals: true
        )
      end.not_to raise_error
    end
  end

  context '.create_organizations_members' do
    it 'is expected to respond to a create_organizations_members method' do
      expect(@instance).to respond_to(:create_organizations_members)
    end

    it 'is expected to respond to a add_organizations_members method' do
      expect(@instance).to respond_to(:add_organizations_members)
    end

    it 'is expected to post /api/v2/organizations/org_id/members' do
      expect(@instance).to receive(:post).with(
        '/api/v2/organizations/org_id/members',
        {
          members: ['123', '456']
        }
      )
      @instance.create_organizations_members('org_id', ['123', '456'])
    end

    it 'is expected to raise an exception when the organization id is empty' do
      expect { @instance.create_organizations_members(nil) }.to raise_exception(Auth0::MissingOrganizationId)
    end
  end

  context '.delete_organizations_members' do
    it 'is expected to respond to a delete_organizations_members method' do
      expect(@instance).to respond_to(:delete_organizations_members)
    end

    it 'is expected to respond to a remove_organizations_members method' do
      expect(@instance).to respond_to(:remove_organizations_members)
    end

    it 'is expected to delete /api/v2/organizations/org_id/members' do
      expect(@instance).to receive(:delete).with(
        '/api/v2/organizations/org_id/members', {
          members: ['123', '456']
        }
      )
      @instance.delete_organizations_members('org_id', ['123', '456'])
    end

    it 'is expected to raise an exception when the organization id is empty' do
      expect { @instance.delete_organizations_members(nil, nil) }.to raise_exception(Auth0::MissingOrganizationId)
    end
    
    it 'is expected to raise an exception when the invitation id is empty' do
      expect { @instance.delete_organizations_members('org_id', []) }.to raise_error 'Must supply an array of member ids'
    end
  end

  context '.get_organizations_member_roles' do
    it 'is expected to respond to a get_organizations_member_roles method' do
      expect(@instance).to respond_to(:get_organizations_member_roles)
    end

    it 'is expected to raise an exception when the org ID is empty' do
      expect { @instance.get_organizations_member_roles(nil, nil) }.to raise_exception(Auth0::MissingOrganizationId)
    end

    it 'is expected to raise an exception when the org ID is empty' do
      expect { @instance.get_organizations_member_roles('org_id', nil) }.to raise_exception(Auth0::InvalidParameter)
    end

    it 'is expected to get roles for a member in an org' do
      expect(@instance).to receive(:get).with(
        '/api/v2/organizations/org_id/members/user_id/roles'
      )
      expect { @instance.get_organizations_member_roles('org_id', 'user_id') }.not_to raise_error
    end

    it 'is expected to get members for an org' do
      expect(@instance).to receive(:get).with(
        '/api/v2/organizations/org_id/members/user_id/roles'
      )
      expect do
        @instance.get_organizations_member_roles('org_id', 'user_id')
      end.not_to raise_error
    end
  end

  context '.create_organizations_member_roles' do
    it 'is expected to respond to a create_organizations_member_roles method' do
      expect(@instance).to respond_to(:create_organizations_member_roles)
    end

    it 'is expected to respond to a add_organizations_member_roles method' do
      expect(@instance).to respond_to(:add_organizations_member_roles)
    end

    it 'is expected to post /api/v2/organizations/org_id/members/user_id/roles' do
      expect(@instance).to receive(:post).with(
        '/api/v2/organizations/org_id/members/user_id/roles',
        {
          roles: ['123', '456']
        }
      )
      @instance.create_organizations_member_roles('org_id', 'user_id', ['123', '456'])
    end

    it 'is expected to raise an exception when the organization id is empty' do
      expect { @instance.create_organizations_member_roles(nil, nil) }.to raise_exception(Auth0::MissingOrganizationId)
    end
  end

  context '.delete_organizations_member_roles' do
    it 'is expected to respond to a delete_organizations_member_roles method' do
      expect(@instance).to respond_to(:delete_organizations_member_roles)
    end

    it 'is expected to respond to a remove_organizations_member_roles method' do
      expect(@instance).to respond_to(:remove_organizations_member_roles)
    end

    it 'is expected to delete /api/v2/organizations/org_id/members/user_id/roles' do
      expect(@instance).to receive(:delete_with_body).with(
        '/api/v2/organizations/org_id/members/user_id/roles', {
          roles: ['123', '456']
        }
      )
      @instance.delete_organizations_member_roles('org_id', 'user_id', ['123', '456'])
    end

    it 'is expected to raise an exception when the organization id is empty' do
      expect { @instance.delete_organizations_member_roles(nil, nil) }.to raise_exception(Auth0::MissingOrganizationId)
    end
    
    it 'is expected to raise an exception when the invitation id is empty' do
      expect { @instance.delete_organizations_member_roles('org_id', nil, nil) }.to raise_error 'Must supply a valid user id'
    end

    it 'is expected to raise an exception when the invitation id is empty' do
      expect { @instance.delete_organizations_member_roles('org_id', 'user_id') }.to raise_error 'Must supply an array of role ids'
    end
  end
end
