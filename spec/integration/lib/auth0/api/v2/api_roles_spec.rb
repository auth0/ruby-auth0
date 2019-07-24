require 'spec_helper'

describe Auth0::Api::V2::Roles do
  attr_reader :client, :test_user, :test_role_name, :test_permission, :test_api, :test_role

  before(:all) do
    @client ||= Auth0::Client.new(v2_creds)

    @test_user_name = "#{entity_suffix}-username-for-roles"
    @test_user_email = "#{entity_suffix}-#{@test_user_name}@auth0.com"

    @test_api_name = "#{entity_suffix}-test-api-for-roles"

    @test_role_name = "#{entity_suffix}-test-role"

    @test_permission_name = "#{entity_suffix}-test-permission"
    @test_permission = ::Auth0::Permission.new(@test_permission_name , @test_api_name)

    VCR.use_cassette('Auth0_Api_V2_Roles/create_test_user') do
      @test_user ||= client.create_user(
        @test_user_name,
        email: @test_user_email,
        password: Faker::Internet.password,
        connection: Auth0::Api::AuthenticationEndpoints::UP_AUTH
      )
    end

    VCR.use_cassette('Auth0_Api_V2_Roles/create_test_api') do
      @test_api ||= client.create_resource_server(
        @test_api_name,
        name: @test_api_name,
        scopes: [{ value: @test_permission_name }]
      )
    end

    VCR.use_cassette('Auth0_Api_V2_Roles/create_test_role') do
      @test_role ||= client.create_role(
        @test_role_name,
        description: 'Test role description'
      )
    end
  end

  after(:all) do
    VCR.use_cassette('Auth0_Api_V2_Roles/delete_test_user') do
      client.delete_user test_user['user_id']
    end

    VCR.use_cassette('Auth0_Api_V2_Roles/delete_test_api') do
      client.delete_resource_server test_api['id']
    end
  end

  describe '.create_role' do
    it 'should create the Role successfully' do
      expect(test_role).to include('id', 'name', 'description')
      expect(test_role).to include(
        'name' => @test_role_name,
        'description' => 'Test role description'
      )
    end
  end

  describe '.get_role', vcr: true do
    let(:test_get_role) { client.get_role test_role['id'] }

    it 'should get the Role successfully' do
      expect(test_get_role).to include('id', 'name', 'description')
      expect(test_get_role).to include(
        'id' => test_role['id'],
        'name' => @test_role_name,
        'description' => 'Test role description'
      )
    end
  end

  describe '.get_roles', vcr: true do
    it 'should get the Role successfully' do
      expect(client.get_roles.count).to be >= 1
    end
  end

  describe '.update_role', vcr: true do
    it 'should update the Role successfully' do
      expect(
        client.update_role(
          test_role['id'],
          name: 'New name',
          description: 'New description'
        )
      ).to include(
        'name' => 'New name',
        'description' => 'New description'
      )
    end
  end

  describe '.add_role_users', vcr: true do
    it 'should add a User to the Role successfully' do
      expect { client.add_role_users test_role['id'], [test_user['user_id']] }.to_not raise_error
    end
  end

  describe '.get_role_users', vcr: true do
    let(:test_get_role_users) { client.get_role_users test_role['id'] }

    it 'should get exactly 1 User' do
      expect(test_get_role_users.count).to equal 1
    end

    it 'should get the added User from the Role successfully' do
      expect(test_get_role_users[0]['user_id']).to eq(test_user['user_id'])
    end
  end

  describe '.add_role_permissions', vcr: true do
    it 'should add a Permission to the Role successfully' do
      expect { client.add_role_permissions test_role['id'], [test_permission] }.to_not raise_error
    end
  end

  describe '.get_role_permissions', vcr: true do
    let(:test_get_role_permissions) { client.get_role_permissions test_role['id'] }

    it 'should get exactly 1 Permission' do
      expect(test_get_role_permissions.count).to equal 1
    end

    it 'should get the added Permission from the Role successfully' do
      expect(test_get_role_permissions[0]['permission_name']).to eq("#{entity_suffix}-test-permission")
    end
  end

  describe '.remove_role_permissions', vcr: true do
    it 'should remove a Permission from the Role successfully' do
      expect { client.remove_role_permissions test_role['id'], [test_permission] }.to_not raise_error
    end
  end

  describe '.delete_role', vcr: true do
    it 'should delete the Role successfully' do
      expect { client.delete_role test_role['id'] }.to_not raise_error
    end
  end
end
