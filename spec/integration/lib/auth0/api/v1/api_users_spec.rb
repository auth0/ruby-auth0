require 'spec_helper'
describe Auth0::Api::V1::Users do
  let(:client) { Auth0Client.new(v1_creds) }
  let(:username) { Faker::Internet.user_name }
  let(:email) { "#{entity_suffix}#{Faker::Internet.safe_email(username)}" }
  let(:password) { Faker::Internet.password }
  let!(:user) do
    client.create_user(email, password, Auth0::Api::AuthenticationEndpoints::UP_AUTH,
                       'username' => username, 'email_verified' => false)
  end

  skip "Users examples are skipped" do
    describe '.users' do
    let(:users) { client.users }

    it { expect(users.size).to be > 0 }

    context '#filters' do
      it { expect(client.users("email: #{email}").size).to be 1 }
    end
    end
  end

  describe '.user' do
    let(:subject) { client.user(user['user_id']) }

    it { should include('email' => email, 'username' => username) }
  end

  describe '.create_user' do
    let(:subject) { user }

    it { should include('user_id', 'identities') }
    it do
      should include(
        'username' => username,
        'email' => email,
        'email_verified' => false
      )
    end
  end

  describe '.delete_user' do
    it { expect { client.delete_user user['user_id'] }.to_not raise_error }

    it { expect { client.delete_user '' }.to raise_error(Auth0::MissingUserId) }
  end

  describe '.patch_user_metadata' do
    it { expect(client.patch_user_metadata(user['user_id'], 'custom_field' => 'custom_value')).to eq 'OK' }
  end
end
