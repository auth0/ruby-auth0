require 'spec_helper'
describe Auth0::Api::V2::Users do

  attr_reader :client, :test_user_name, :test_user_email, :test_user, :test_user_secondary,
              :test_role, :test_api_name, :test_permission_name, :test_permission

  before(:all) do
    @client ||= Auth0::Client.new(v2_creds)

    @test_user_name = "#{entity_suffix}-username"
    @test_user_email = "#{entity_suffix}-#{@test_user_name}@auth0.com"

    @test_api_name = "#{entity_suffix}-test-api-for-users"
    @test_api_scope = 'test:scope'

    @test_permission_name = "#{entity_suffix}-test-permission-for-users"
    @test_permission = ::Auth0::Permission.new("#{entity_suffix}-test-permission-for-users", @test_api_name)

    VCR.use_cassette('Auth0_Api_V2_Users/create_test_user') do
      @test_user ||= client.create_user(
        @test_user_name,
        email: @test_user_email,
        password: Faker::Internet.password,
        connection: Auth0::Api::AuthenticationEndpoints::UP_AUTH
      )
    end

    VCR.use_cassette('Auth0_Api_V2_Users/create_secondary_test_user') do
      @test_user_secondary ||= client.create_user(
        "#{test_user_name}-secondary",
        email: "#{entity_suffix}-#{@test_user_name}-secondary@auth0.com",
        password: Faker::Internet.password,
        connection: Auth0::Api::AuthenticationEndpoints::UP_AUTH
      )
    end

    VCR.use_cassette('Auth0_Api_V2_Users/create_test_api') do
      @test_api ||= client.create_resource_server(
        @test_api_name,
        name: @test_api_name,
        scopes: [{ value: @test_api_scope }]
      )
    end

    VCR.use_cassette('Auth0_Api_V2_Users/create_test_role') do
      @test_role ||= client.create_role(
        "#{entity_suffix}-test-role-for-users",
        description: 'Test role description'
      )
    end
  end

  after(:all) do
    VCR.use_cassette('Auth0_Api_V2_Users/delete_test_api') do
      client.delete_resource_server @test_api['id']
    end

    VCR.use_cassette('Auth0_Api_V2_Users/delete_test_role') do
      client.delete_role @test_role['id']
    end
  end

  describe '.create_user', vcr: true do
    it 'should return the created user' do
      expect(test_user).to include('user_id', 'email', 'email_verified', 'name')
      expect(test_user).to include(
        'email' => test_user_email,
        'name' => test_user_name,
        'email_verified' => false
      )
    end
  end

  describe '.users', vcr: true do
    let(:users) do
      client.users
    end

    it 'should have at least one user' do
      expect(users.size).to be > 0
    end

    context '#filters' do
      it 'should return the correct number of results when paginated' do
        expect(client.users(per_page: 1).size).to be 1
      end

      it 'should include the indicated fields when paginated' do
        expect(
          client.users(
            per_page: 1,
            fields: [:picture, :email, :user_id].join(','),
            include_fields: true
          ).first
        ).to(include('email', 'user_id', 'picture'))
      end

      it 'should not include other fields when paginated' do
        expect(
          client.users(
            per_page: 1,
            fields: [:email].join(',')
          ).first
        ).to_not include('user_id', 'picture')
      end

      it 'should exclude the indicated fields when paginated' do
        expect(
          client.users(
            per_page: 1,
            fields: [:email].join(','),
            include_fields: false
          ).first
        ).to include('user_id', 'picture')
      end

      it 'is expected to find a user with a v2 search engine query' do
        expect(
          client.users(
            per_page: 1,
            fields: 'user_id',
            q: "updated_at:{2016-01-01 TO *}",
            search_engine: 'v2'
          ).first
        ).to include('user_id')
      end

      it 'is expected to find a user with a v3 search engine query' do
        expect(
          client.users(
            per_page: 1,
            fields: 'user_id',
            q: "updated_at:[2016-01-01 TO *]",
            search_engine: 'v3'
          ).first
        ).to include('user_id')
      end
    end
  end

  describe '.user', vcr: true do
    it 'should retrieve the created user' do
      expect(
        client.user(test_user['user_id'])
      ).to include(
        'email' => test_user_email,
        'name' => test_user_name
      )
    end

    context '#filters' do
      it 'should include the fields indicated' do
        expect(
          client.user(
            test_user['user_id'],
            fields: [:picture, :email, :user_id].join(','),
            include_fields: true
          )
        ).to include('email', 'user_id', 'picture')
      end

      it 'should exclude the fields indicated' do
        expect(
          client.user(
            test_user['user_id'],
            fields: [:picture, :email, :user_id].join(','),
            include_fields: false
          )
        ).not_to include('picture', 'email', 'user_id')
      end

      it 'should exclude fields not indicated' do
        expect(
          client.user(
            test_user['user_id'],
            fields: [:email].join(','))
        ).to_not include('user_id', 'picture')
      end
    end
  end

  describe '.patch_user', vcr: true do
    let(:patch_user_body) do
      {
        'email_verified' => true,
        'user_metadata' => {
          'addresses' => { 'home_address' => '742 Evergreen Terrace' }
        }
      }
    end

    it 'should patch the User successfully' do
      expect(
        client.patch_user(test_user['user_id'], patch_user_body)
      ).to include(patch_user_body)
    end
  end

  describe '.delete_user_provider', vcr: true do
    it 'should attempt to delete the MFA provider for the User' do
      expect { client.delete_user_provider test_user['user_id'], 'google-authenticator' }.to_not raise_error
    end
  end

  describe '.link_user_account', vcr: true do
    let(:secondary_account_body) do
      {
        provider: 'auth0',
        user_id: test_user_secondary['user_id']
      }
    end

    it 'should link two Users successfully' do
      expect { client.link_user_account test_user['user_id'], secondary_account_body }.to_not raise_error
    end
  end

  describe '.unlink_user_account', vcr: true do
    it 'should unlink two Users successfully' do
      expect do
        client.unlink_user_account test_user['user_id'], 'auth0', test_user_secondary['user_id']
      end.to_not raise_error
    end
  end

  describe '.user_logs', vcr: true do
    it 'should get Logs for a User successfully' do
      expect { client.user_logs( test_user['user_id'], per_page: 2 ) }.to_not raise_error
    end
  end

  describe '.add_user_roles', vcr: true do
    it 'should add a Role to a User successfully' do
      expect { client.add_user_roles test_user['user_id'], [ test_role['id'] ] }.to_not raise_error
    end
  end

  describe '.get_user_roles', vcr: true do
    it 'should get Roles for a User successfully' do
      expect( client.get_user_roles(test_user['user_id']).first ).to include(
        'id' => test_role['id']
      )
    end
  end

  describe '.remove_user_roles', vcr: true do
    it 'should remove a Role from a User successfully' do
      expect { client.remove_user_roles test_user['user_id'], [ test_role['id'] ] }.to_not raise_error
    end
  end

  describe '.get_enrollments', vcr: true do
    it 'should get Enrollments for a User successfully' do
      expect { client.get_enrollments test_user['user_id'] }.to_not raise_error
    end
  end

  describe '.add_user_permissions', vcr: true do
    it 'should add a Permissions for a User successfully' do
      expect { client.add_user_permissions test_user['user_id'], [ test_permission ] }.to_not raise_error
    end
  end

  describe '.get_user_permissions', vcr: true do
    let(:test_get_user_permissions) do
      client.get_user_permissions test_user['user_id']
    end

    it 'should get exactly 1 Permission for a User successfully' do
      expect( test_get_user_permissions.count ).to eq 1
    end

    it 'should get the correct Permission for a User successfully' do
      expect( test_get_user_permissions.first['permission_name'] ).to eq test_permission_name
      expect( test_get_user_permissions.first['resource_server_name'] ).to eq test_api_name
    end
  end

  describe '.remove_user_permissions', vcr: true do
    it 'should remove a Permission from a User successfully' do
      expect { client.remove_user_permissions test_user['user_id'], [ test_permission ] }.to_not raise_error
    end
  end

  describe '.invalidate_browsers', vcr: true do
    it 'should invalidate MFA browsers for the User successfully' do
      expect { client.invalidate_browsers test_user['user_id'] }.to_not raise_error
    end
  end

  describe '.delete_user', vcr: true do
    it 'should delete the User successfully' do
      expect { client.delete_user test_user['user_id'] }.to_not raise_error
    end

    it 'should delete the secondary User successfully' do
      expect { client.delete_user test_user_secondary['user_id'] }.to_not raise_error
    end
  end
end
