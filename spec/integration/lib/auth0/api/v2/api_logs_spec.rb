require 'spec_helper'

describe Auth0::Api::V2::Logs do
  attr_reader :client, :user

  before(:all) do
    @client = Auth0Client.new(v2_creds)
    username = Faker::Internet.user_name
    email = "#{entity_suffix}#{Faker::Internet.safe_email(username)}"
    password = Faker::Internet.password
    @user = client.create_user(username,  'email' => email,
                                          'password' => password,
                                          'email_verified' => false,
                                          'connection' => Auth0::Api::AuthenticationEndpoints::UP_AUTH,
                                          'app_metadata' => {})
  end

  after(:all) do
    client.delete_user(user['user_id'])
  end


  describe '.logs' do
    let(:logs) { client.logs }
    it { expect(logs.size).to be > 0 }
    it { expect(logs.find {|log| log['description'] == 'Create a user' && log['type'] == 'sapi' && log['details']['request']['body']['email'] == user['email'] }).to_not be_empty }

    context '#filters' do
      it { expect(client.logs(per_page: 1).size).to be 1 }
      it do
        expect(
          client.logs(per_page: 1, fields: [:date, :description, :type].join(','), include_fields: true).first
        ).to(include('date', 'description', 'type'))
      end
      it { expect(client.logs(per_page: 1, fields: [:date].join(',')).first).to_not include('type', 'description') }
      it do
        expect(
          client.logs(per_page: 1, fields: [:date].join(','), include_fields: false).first
        ).to include('type', 'description')
      end
    end
    context '#from' do
      it { expect(client.logs(from: logs.last['_id'], take: 1).size).to be 1 }
      it { expect(client.logs(from: logs.first['_id'], take: 1).size).to be 0 }
    end
  end

  describe '.log' do
    let(:first_log) { client.logs.first }
    let(:log) { client.log(first_log['_id']) }
    it { expect(log).to_not be_empty }
    it { expect(log['_id']).to eq(first_log['_id']) }
    it { expect(log['date']).to eq(first_log['date']) }
  end
end
