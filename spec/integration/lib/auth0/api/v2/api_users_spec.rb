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
        expect(
          client.users(per_page: 1, fields: [:picture, :email, :user_id].join(','), include_fields: true).first
        ).to(include('email', 'user_id', 'picture'))
      end
      it { expect(client.users(per_page: 1, fields: [:email].join(',')).first).to_not include('user_id', 'picture') }
      it do
        expect(
          client.users(per_page: 1, fields: [:email].join(','), include_fields: false).first
        ).to include('user_id', 'picture')
      end
    end
  end

  describe '.user' do
    let(:subject) { client.user(user['user_id']) }

    it { should include('email' => email, 'name' => username) }
    it do
      expect(
        client.user(user['user_id'], fields: [:picture, :email, :user_id].join(','), include_fields: true)
      ).to(include('email', 'user_id', 'picture'))
    end
    it do
      expect(
        client.user(user['user_id'], fields: [:picture, :email, :user_id].join(','), include_fields: false)
      ).not_to(include('email', 'user_id', 'picture'))
    end

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
    let(:body_path) do
      {
        'user_metadata' => {
          'addresses' => { 'home_address' => '742 Evergreen Terrace' }
        }
      }
    end
    it do
      expect(
        client.patch_user(user['user_id'], body_path)
      ).to(include('user_metadata' => { 'addresses' => { 'home_address' => '742 Evergreen Terrace' } }))
    end
  end

  describe '.link_user_account and .unlink_users_account' do
    let(:email_link) { "#{entity_suffix}#{Faker::Internet.safe_email(Faker::Internet.user_name)}" }
    let!(:link_user) do
      client.create_user(username,  'email' => email_link,
                                    'password' => Faker::Internet.password,
                                    'email_verified' => false,
                                    'connection' => Auth0::Api::AuthenticationEndpoints::UP_AUTH,
                                    'app_metadata' => {})
    end
    let(:email_primary) { "#{entity_suffix}#{Faker::Internet.safe_email(Faker::Internet.user_name)}" }
    let!(:primary_user) do
      client.create_user(username,  'email' => email_primary,
                                    'password' => Faker::Internet.password,
                                    'email_verified' => false,
                                    'connection' => Auth0::Api::AuthenticationEndpoints::UP_AUTH,
                                    'app_metadata' => {})
    end

    let(:body_link) { { 'provider' => 'auth0', 'user_id' => link_user['user_id'] } }
    skip 'Link user account examples are skipped to avoid errors on users deletion' do
      it do
        expect(
          client.link_user_account(primary_user['user_id'], body_link).first
        ).to include('provider' => 'auth0', 'user_id' => primary_user['identities'].first['user_id'])
      end

      it do
        expect(
          client.unlink_users_account(primary_user['user_id'], 'auth0', link_user['user_id']).first
        ).to include('provider' => 'auth0', 'user_id' => primary_user['identities'].first['user_id'])
      end
    end
  end
end
