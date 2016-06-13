require 'spec_helper'
describe Auth0::Api::V2::Jobs do
  skip "Jobs examples are skipped to avoid Job's creation" do
    let(:client) { Auth0Client.new(v2_creds) }
    let(:username) { Faker::Internet.user_name }
    let(:email) { "#{entity_suffix}#{Faker::Internet.safe_email(username)}" }

    describe '.import_users and .get_job' do
      let(:file_content) do
        [{
          'email' => email,
          'email_verified' => false,
          'app_metadata' => {
            'roles' => ['admin'],
            'plan' => 'premium'
          },
          'user_metadata' => {
            'theme' => 'light'
          }
        }
        ]
      end
      let(:users_file) do
        File.new('temp.json', 'w+') { |f| f.write(file_content) }
      end
      let(:connection_id) do
        client.connections
              .find do |connection|
          connection['name'].include?(Auth0::Api::AuthenticationEndpoints::UP_AUTH)
        end['id']
      end
      let(:imported_users) { client.import_users(users_file, connection_id) }
      it do
        expect(imported_users).to include(
          'connection' => Auth0::Api::AuthenticationEndpoints::UP_AUTH,
          'status' => 'pending',
          'type' => 'users_import')
      end
      let(:import_job_id) { imported_users['id'] }
      it do
        expect(client.get_job(import_job_id)).to include(
          'connection' => Auth0::Api::AuthenticationEndpoints::UP_AUTH, 'type' => 'users_import', 'id' => import_job_id)
      end
    end

    describe '.send_verification_email and .get_job' do
      let(:user) do
        client.create_user(username,  'email' => email,
                                      'password' => Faker::Internet.password,
                                      'email_verified' => false,
                                      'connection' => Auth0::Api::AuthenticationEndpoints::UP_AUTH,
                                      'app_metadata' => {})
      end
      let(:email_verification_job) { client.send_verification_email(user['user_id']) }
      it { expect(email_verification_job).to include('status' => 'pending', 'type' => 'verification_email') }
      let(:email_job_id) { email_verification_job['id'] }
      it do
        expect(client.get_job(email_job_id)).to include(
          'status' => 'completed', 'type' => 'verification_email', 'id' => email_job_id)
      end
    end

    after(:all) do
      new_client = Auth0Client.new(v2_creds)
      delete_user_id = new_client.get_users(q: 'email:@example.com').first['user_id']
      new_client.delete_user(delete_user_id)
    end
  end
end
