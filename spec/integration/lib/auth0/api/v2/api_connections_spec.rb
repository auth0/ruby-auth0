require 'spec_helper'
describe Auth0::Api::V2::Connections do
  attr_reader :client,
              :test_user_name, :test_user_email,
              :test_con_name, :test_con_strategy, :test_conn

  before(:all) do
    @client ||= Auth0Client.new(v2_creds)
    @test_user_name = "#{entity_suffix}-username"
    @test_user_email = "#{entity_suffix}-#{test_user_name}@auth0.com"
    @test_con_name = "TestConnection-#{entity_suffix}"
    @test_con_strategy = 'auth0'

    VCR.use_cassette(
      'Auth0_Api_V2_Connections/create_test_connection'
    ) do
      @test_conn ||= client.create_connection(
        name: test_con_name,
        strategy: test_con_strategy
      )
    end

    VCR.use_cassette(
      'Auth0_Api_V2_Connections/create_test_user'
    ) do
      @test_user ||= client.create_user(
        test_user_name,
        email: test_user_email,
        password: Faker::Internet.password,
        connection: Auth0::Api::AuthenticationEndpoints::UP_AUTH
      )
    end
  end

  describe '.create_connection', vcr: true do
    let(:subject) { test_conn }

    it 'should return specific fields upon creation' do
      should include('id', 'name', 'options', 'strategy')
    end

    it 'should return the data sent' do
      should include(
        'name' => test_conn['name'],
        'strategy' => test_con_strategy
      )
    end
  end

  describe '.connection', vcr: true do
    let(:subject) do
      client.connection(test_conn['id'])
    end

    it 'should find the correct connection' do
      should include('name' => test_conn['name'])
    end

    context '#filters' do
      it 'should include the fields indicated' do
        expect(
          client.connection(
            test_conn['id'],
            fields: %i[name id].join(',')
          )
        ).to include('id', 'name')
      end

      it 'should exclude the fields indicated' do
        expect(
          client.connection(
            test_conn['id'],
            fields: %i[name id].join(','),
            include_fields: false
          )
        ).to_not(
          include('id', 'name')
        )
      end
    end
  end

  describe '.connections', vcr: true do
    let(:connections) do
      client.connections
    end

    it 'should not be empty' do
      expect(connections.size).to be > 0
    end

    it 'should include the previously created connection' do
      expect(
        connections.find do |con|
          con['name'] == test_con_name
        end
      ).to_not be_empty
    end

    context '#filters' do
      it 'should include previously-created connection when filtered' do
        expect(
          client.connections(strategy: test_con_strategy).size
        ).to be > 0
      end

      it 'should should include the fields indicated from filtered results' do
        expect(
          client.connections(
            strategy: test_con_strategy,
            fields: [:name].join(',')
          ).first
        ).to include('name')
      end

      it 'should should exclude the fields indicated from filtered results' do
        expect(
          client.connections(
            strategy: test_con_strategy,
            fields: [:name].join(','),
            include_fields: false
          ).first
        ).to_not include('name')
      end
    end
  end

  describe '.delete_connection_user', vcr: true do
    let(:connection) do
      client.connections.find do |connection|
        connection['name'] == Auth0::Api::AuthenticationEndpoints::UP_AUTH
      end
    end

    it 'should delete the user created' do
      expect(
        client.delete_connection_user(connection['id'], test_user_email)
      ).to be_empty
    end
  end

  describe '.update_connection', vcr: true do
    it 'should update the connection' do
      new_options = test_conn['options']
      new_options['passwordPolicy'] = 'excellent'
      expect(
        client.update_connection(
          test_conn['id'],
          options: new_options
        )['options']['passwordPolicy']
      ).to eq 'excellent'
    end
  end

  describe '.delete_connection', vcr: true do
    it 'should delete the connection' do
      expect { client.delete_connection test_conn['id'] }.to_not raise_error
    end
  end
end
