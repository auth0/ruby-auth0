require 'spec_helper'
describe Auth0::Api::V2::Jobs do
  UP_AUTH = Auth0::Api::AuthenticationEndpoints::UP_AUTH

  let(:client) { Auth0Client.new(v2_creds) }
  let(:username) { Faker::Internet.user_name }
  let(:email) { "#{entity_suffix}#{Faker::Internet.safe_email(username)}" }
  let(:connection_id) do
    VCR.use_cassette('Auth0_Api_V2_Jobs/search_for_connection_id') do
      client.connections.find do |connection|
        connection['name'].include?(UP_AUTH)
      end['id']
    end
  end

  describe '.import_users and .get_job', vcr: true do
    let(:file_name) { 'spec/fixtures/api-jobs-spec-import-users.json' }
    let(:file_content) do
      [{
        email: email,
        email_verified: false,
        app_metadata: { roles: ['admin'] },
        user_metadata: { theme: 'light' }
      }].to_json
    end
    let(:import_file) do
      File.open(file_name, 'w+') { |f| f.write(file_content) }
      File.new(file_name, 'rb')
    end
    let(:imported_users) { client.import_users(import_file, connection_id) }
    let(:import_job_id) { imported_users['id'] }

    it 'should create an import users job successfully' do
      expect(imported_users).to include(
        'connection' => UP_AUTH,
        'type' => 'users_import'
      )
    end

    it 'should get the import users job' do
      expect(client.get_job(import_job_id)).to include(
        'connection' => UP_AUTH,
        'type' => 'users_import',
        'id' => import_job_id
      )
    end

    after do
      File.delete(file_name)
    end
  end

  describe '.export_users and .get_job', vcr: true do
    let(:exported_users) { client.export_users(connection_id: connection_id) }
    let(:export_job_id) { exported_users['id'] }

    it 'should create an export users job successfully' do
      expect(exported_users).to include(
        'connection' => UP_AUTH,
        'type' => 'users_export'
      )
    end

    it 'should get the export users job' do
      expect(client.get_job(export_job_id)).to include(
        'connection' => UP_AUTH,
        'type' => 'users_export',
        'id' => export_job_id
      )
    end
  end

  describe '.send_verification_email and .get_job', vcr: true do
    let(:user) do
      client.create_user(
        username,
        'email' => email,
        'password' => Faker::Internet.password,
        'connection' => UP_AUTH
      )
    end
    let(:email_verification_job) { client.send_verification_email(user['user_id']) }
    let(:email_job_id) { email_verification_job['id'] }

    it 'should create a new verification_email job' do
      expect(
        email_verification_job
      ).to include('status' => 'pending', 'type' => 'verification_email')
    end

    it 'should get the completed verification_email' do
      expect(client.get_job(email_job_id)).to include(
        'type' => 'verification_email',
        'id' => email_job_id
      )
    end

    it 'should reject an invalid client_id' do
      expect do
        client.send_verification_email(user['user_id'], Random.new(32).to_s)
      end.to raise_error Auth0::BadRequest
    end
  end

  after(:all) do
    VCR.use_cassette('Auth0_Api_V2_Jobs/delete_imported_user') do
      new_client = Auth0Client.new(v2_creds)
      delete_user = new_client.get_users(q: "email:#{entity_suffix}*").first
      new_client.delete_user(delete_user['user_id']) unless delete_user.nil?
    end
  end
end
