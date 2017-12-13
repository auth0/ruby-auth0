require 'spec_helper'
describe Auth0::Api::V2::Connections do
  attr_reader :client, :connection, :strategy, :name, :enabled_clients, :options

  before(:all) do
    @client = Auth0Client.new(v2_creds)
    @name = "#{SecureRandom.uuid[0..25]}#{entity_suffix}"
    @strategy = 'google-oauth2'
    @options = {}
    @enabled_clients = []
    @connection = client.create_connection(name: name,
                                           strategy: strategy,
                                           options: options,
                                           enabled_clients: enabled_clients)
  end

  describe '.connections' do
    let(:connections) { client.connections }

    it do
      sleep 1
      expect(connections.size).to be > 0
    end
    it do
      sleep 1
      expect(connections.find { |con| con['name'] == name }).to_not be_empty
    end

    context '#filters' do
      it do
        sleep 1
        expect(client.connections(strategy: strategy).size).to be > 0
      end
      it do
        sleep 1
        expect(client.connections(strategy: strategy, fields: [:name].join(',')).first).to include('name')
      end
      it do
        sleep 1
        expect(client.connections(strategy: strategy, fields: [:name].join(','), include_fields: false).first).to_not(
          include('name')
        )
      end
    end
  end

  describe '.connection' do
    let(:subject) do
      sleep 1
      client.connection(connection['id'])
    end

    it { should include('name' => connection['name']) }

    context '#filters' do
      it do
        sleep 1
        expect(client.connection(connection['id'], fields: [:name, :id].join(','))).to include('id', 'name')
      end
      it do
        sleep 1
        expect(client.connection(connection['id'], fields: [:name, :id].join(','), include_fields: false)).to_not(
          include('id', 'name')
        )
      end
    end
  end

  describe '.create_connection' do
    let(:subject) { connection }

    it { should include('id', 'name') }
    it { should include('name' => connection['name']) }
  end

  describe '.delete_connection' do
    it do
      sleep 1
      expect { client.delete_connection connection['id'] }.to_not raise_error
    end
  end

  describe '.update_connection' do
    let!(:connection_to_update) do
      client.create_connection(name: "#{SecureRandom.uuid[0..25]}#{entity_suffix}",
                               strategy: strategy,
                               options: options,
                               enabled_clients: enabled_clients)
    end
    new_name = SecureRandom.uuid[0..25]
    let(:options) { { username: new_name } }
    it do
      sleep 1
      expect(client.update_connection(connection_to_update['id'], 'options' => options)['options']).to include(
        'username' => new_name
      )
    end
  end

  describe '.delete_connection_user' do
    let(:username) { Faker::Internet.user_name }
    let(:email) { "#{entity_suffix}#{Faker::Internet.safe_email(username)}" }
    let(:password) { Faker::Internet.password }
    let!(:user_to_delete) do
      sleep 1
      client.create_user(username,  email: email,
                                    password: password,
                                    email_verified: false,
                                    connection: Auth0::Api::AuthenticationEndpoints::UP_AUTH,
                                    app_metadata: {})
    end
    let(:connection) do
      sleep 1
      client.connections.find { |connection| connection['name'] == Auth0::Api::AuthenticationEndpoints::UP_AUTH }
    end

    it do
      sleep 1
      expect(client.delete_connection_user(connection['id'], email)).to be_empty
    end
  end

  after(:all) do
    client
      .connections
      .select { |connection| connection['name'].include?(entity_suffix) }
      .each { |connection| client.delete_connection(connection['id']) }
  end
end
