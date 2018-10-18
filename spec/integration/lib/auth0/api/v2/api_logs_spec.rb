require 'spec_helper'

describe Auth0::Api::V2::Logs do
  attr_reader :client, :test_user

  before(:all) do
    @client = Auth0Client.new(v2_creds)
    test_user_name = "#{entity_suffix}-username"

    VCR.use_cassette('Auth0_Api_V2_Logs/create_test_user') do
      @test_user = client.create_user(
        test_user_name,
        'email' => "#{entity_suffix}-#{test_user_name}@auth0.com",
        'password' => Faker::Internet.password,
        'connection' => Auth0::Api::AuthenticationEndpoints::UP_AUTH
      )
    end
  end

  after(:all) do
    VCR.use_cassette('Auth0_Api_V2_Logs/delete_test_user') do
      client.delete_user(test_user['user_id'])
    end
  end

  describe '.logs', vcr: true do
    let(:logs) do
      client.logs
    end

    context '#filters' do
      it 'should have one log entry' do
        expect(client.logs(per_page: 1).size).to be 1
      end

      it 'should include the specified fields' do
        expect(
          client.logs(
            per_page: 1,
            fields: %i[date description type].join(','),
            include_fields: true
          ).first
        ).to(include('date', 'description', 'type'))
      end

      it 'should exclude fields not specified' do
        expect(
          client.logs(
            per_page: 1,
            fields: [:date].join(',')
          ).first
        ).to_not include('type', 'description')
      end

      it 'should exclude the specified fields' do
        expect(
          client.logs(
            per_page: 1,
            fields: [:date].join(','),
            include_fields: false
          ).first
        ).to include('type', 'description')
      end
    end

    context '#from' do
      it 'should take one log entry' do
        expect(client.logs(from: logs.last['_id'], take: 1).size).to be 1
      end
    end
  end

  describe '.log', vcr: true do
    let(:first_log) do
      client.logs.first
    end

    let(:log) do
      client.log(first_log['_id'])
    end

    it 'should not be empty' do
      expect(log).to_not be_empty
    end

    it 'should match the created log entry' do
      expect(log['_id']).to eq(first_log['_id'])
    end
  end
end
