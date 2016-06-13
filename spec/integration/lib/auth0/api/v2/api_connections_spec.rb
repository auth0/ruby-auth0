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

    it { expect(connections.size).to be > 0 }
    it { expect(connections.find { |con| con['name'] == name }).to_not be_nil }

    context '#filters' do
      it { expect(client.connections(strategy: strategy).size).to be > 0 }
      it { expect(client.connections(strategy: strategy, fields: [:name].join(',')).first).to include('name') }
      it do
        expect(client.connections(strategy: strategy, fields: [:name].join(','), include_fields: false).first).to_not(
          include('name')
        )
      end
    end
  end

  describe '.connection' do
    let(:subject) { client.connection(connection['id']) }

    it { should include('name' => connection['name']) }

    context '#filters' do
      it { expect(client.connection(connection['id'], fields: [:name, :id].join(','))).to include('id', 'name') }
      it do
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
    it { expect { client.delete_connection connection['id'] }.to_not raise_error }
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
      client.create_user(username,  email: email,
                                    password: password,
                                    email_verified: false,
                                    connection: Auth0::Api::AuthenticationEndpoints::UP_AUTH,
                                    app_metadata: {})
    end
    let(:connection) do
      client.connections.find { |connection| connection['name'] == Auth0::Api::AuthenticationEndpoints::UP_AUTH }
    end

    it { expect(client.delete_connection_user(connection['id'], email)).to be_nil }
  end

  after(:all) do
    client
      .connections
      .select { |connection| connection['name'].include?(entity_suffix) }
      .each { |connection| client.delete_connection(connection['id']) }
  end
end
