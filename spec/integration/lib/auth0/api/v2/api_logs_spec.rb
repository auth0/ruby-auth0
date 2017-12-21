require 'spec_helper'

describe Auth0::Api::V2::Logs do
  attr_reader :client, :user

  before(:all) do
    @client = Auth0Client.new(v2_creds)
    username = Faker::Internet.user_name
    email = "#{entity_suffix}#{Faker::Internet.safe_email(username)}"
    password = Faker::Internet.password
    sleep 1
    @user = client.create_user(username,  'email' => email,
                                          'password' => password,
                                          'email_verified' => false,
                                          'connection' => Auth0::Api::AuthenticationEndpoints::UP_AUTH,
                                          'app_metadata' => {})
  end

  after(:all) do
    sleep 1
    client.delete_user(user['user_id'])
  end

  describe '.logs' do
    let(:logs) do
      sleep 1
      client.logs
    end

    context '#filters' do
      it do
        sleep 1
        expect(client.logs(per_page: 1).size).to be 1
      end
      it do
        sleep 1
        expect(
          client.logs(per_page: 1, fields: [:date, :description, :type].join(','), include_fields: true).first
        ).to(include('date', 'description', 'type'))
      end
      it do
        sleep 1
        expect(client.logs(per_page: 1, fields: [:date].join(',')).first).to_not include('type', 'description')
      end
      it do
        sleep 1
        expect(
          client.logs(per_page: 1, fields: [:date].join(','), include_fields: false).first
        ).to include('type', 'description')
      end
    end

    context '#from' do
      it do
        sleep 1
        expect(client.logs(from: logs.last['_id'], take: 1).size).to be 1
      end
    end
  end

  describe '.log' do
    let(:first_log) do
      sleep 1
      client.logs.first
    end
    let(:log) do
      sleep 1
      client.log(first_log['_id'])
    end
    it do
      sleep 1
      expect(log).to_not be_empty
    end
    it do
      sleep 1
      expect(log['_id']).to eq(first_log['_id'])
    end
    it do
      sleep 1
      expect(log['date']).to eq(first_log['date'])
    end
  end
end
