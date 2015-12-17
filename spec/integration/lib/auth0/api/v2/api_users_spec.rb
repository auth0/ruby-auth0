require 'spec_helper'
describe Auth0::Api::V2::Users do
  let(:client) { Auth0Client.new(v2_creds) }
  let(:username) { Faker::Internet.user_name }
  let(:email) { "#{entity_suffix}#{Faker::Internet.safe_email(username)}" }
  let(:password) { Faker::Internet.password }
  let!(:user) do
    client.create_user(username,  'email' => email,
                                  'password' => password,
                                  'email_verified' => false,
                                  'connection' => Auth0::Api::AuthenticationEndpoints::UP_AUTH,
                                  'app_metadata' => {})
  end

  describe '.users' do
    let(:users) { client.users }

    it { expect(users.size).to be > 0 }

    context '#filters' do
      it { expect(client.users(per_page: 1).size).to be 1 }
      it do
        expect(client.users(per_page: 1, fields: [:picture, :email, :user_id].join(',')).first).to(
          include('email', 'user_id', 'picture'))
      end
      it { expect(client.users(per_page: 1, fields: [:email].join(',')).first).to_not include('user_id', 'picture') }
    end
  end

  describe '.user' do
    let(:subject) { client.user(user['user_id']) }

    it { should include('email' => email, 'name' => username) }

    context '#filters' do
      it do
        expect(client.user(user['user_id'], fields: [:picture, :email, :user_id].join(','))).to(
          include('email', 'user_id', 'picture'))
      end
      it { expect(client.user(user['user_id'], fields: [:email].join(','))).to_not include('user_id', 'picture') }
    end
  end

  describe '.create_user' do
    let(:subject) { user }

    it { should include('user_id', 'identities') }
    it { expect(client.patch_user(user['user_id'], 'email_verified' => true)).to include('email_verified' => true) }
  end

  describe '.delete_user' do
    it { expect { client.delete_user user['user_id'] }.to_not raise_error }
    it { expect { client.delete_user '' }.to raise_error(Auth0::MissingUserId) }
  end

  describe '.patch_user' do
    it { expect(client.patch_user(user['user_id'], 'email_verified' => true)).to(include('email_verified' => true)) }
  end
end
