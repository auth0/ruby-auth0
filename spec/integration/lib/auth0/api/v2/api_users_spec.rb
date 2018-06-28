require 'spec_helper'
describe Auth0::Api::V2::Users do
  let(:client) { Auth0Client.new(v2_creds) }
  let(:username) { Faker::Internet.user_name }
  let(:email) { "#{entity_suffix}#{Faker::Internet.safe_email(username)}" }
  let(:password) { Faker::Internet.password }
  let(:user) do
    sleep 1
    client.create_user(username,  'email' => email,
                                  'password' => password,
                                  'email_verified' => false,
                                  'connection' => Auth0::Api::AuthenticationEndpoints::UP_AUTH,
                                  'app_metadata' => {})
  end

  describe '.users' do
    let(:users) do
      sleep 1
      client.users
    end

    it do
      sleep 1
      expect(users.size).to be > 0
    end

    context '#filters' do
      it do
        sleep 1
        expect(client.users(per_page: 1).size).to be 1
      end
      it do
        sleep 1
        expect(
          client.users(per_page: 1, fields: [:picture, :email, :user_id].join(','), include_fields: true).first
        ).to(include('email', 'user_id', 'picture'))
      end
      it do
        sleep 1
        expect(client.users(per_page: 1, fields: [:email].join(',')).first).to_not include('user_id', 'picture')
      end
      it do
        sleep 1
        expect(
          client.users(per_page: 1, fields: [:email].join(','), include_fields: false).first
        ).to include('user_id', 'picture')
      end

      it 'is expected to find a user with a v2 search engine query' do
        sleep 1
        expect(
          client.users(
            per_page: 1,
            fields: 'user_id',
            q: "updated_at:>=2016-01-01",
            search_engine: 'v2'
          ).first
        ).to include('user_id')
      end

      it 'is expected to find a user with a v3 search engine query' do
        sleep 1
        expect(
          client.users(
            per_page: 1,
            fields: 'user_id',
            q: "updated_at:[2016-01-01 TO *]",
            search_engine: 'v3'
          ).first
        ).to include('user_id')
      end
    end
  end

  describe '.user' do
    let(:subject) do
      sleep 1
      client.user(user['user_id'])
    end

    it do
      sleep 1
      should include('email' => email, 'name' => username)
    end
    it do
      sleep 1
      expect(
        client.user(user['user_id'], fields: [:picture, :email, :user_id].join(','), include_fields: true)
      ).to(include('email', 'user_id', 'picture'))
    end
    it do
      sleep 1
      expect(
        client.user(user['user_id'], fields: [:picture, :email, :user_id].join(','), include_fields: false)
      ).not_to(include('email', 'user_id', 'picture'))
    end

    context '#filters' do
      it do
        sleep 1
        expect(client.user(user['user_id'], fields: [:picture, :email, :user_id].join(','))).to(
          include('email', 'user_id', 'picture')
        )
      end
      it do
        sleep 1
        expect(client.user(user['user_id'], fields: [:email].join(','))).to_not include('user_id', 'picture')
      end
    end
  end

  describe '.create_user' do
    let(:subject) { user }

    it do
      sleep 1
      should include('user_id', 'identities')
    end
    it do
      sleep 1
      expect(client.patch_user(user['user_id'], 'email_verified' => true)).to include('email_verified' => true)
    end
  end

  describe '.delete_user' do
    it do
      sleep 1
      expect { client.delete_user user['user_id'] }.to_not raise_error
    end
    it do
      sleep 1
      expect { client.delete_user '' }.to raise_error(Auth0::MissingUserId)
    end
  end

  describe '.patch_user' do
    it do
      sleep 1
      expect(client.patch_user(user['user_id'], 'email_verified' => true)).to(include('email_verified' => true))
    end
    let(:body_path) do
      {
        'user_metadata' => {
          'addresses' => { 'home_address' => '742 Evergreen Terrace' }
        }
      }
    end
    it do
      sleep 1
      expect(
        client.patch_user(user['user_id'], body_path)
      ).to(include('user_metadata' => { 'addresses' => { 'home_address' => '742 Evergreen Terrace' } }))
    end
  end

  describe '.link_user_account and .unlink_users_account' do
    let(:email_link) { "#{entity_suffix}#{Faker::Internet.safe_email(Faker::Internet.user_name)}" }
    let!(:link_user) do
      sleep 1
      client.create_user(username,  'email' => email_link,
                                    'password' => Faker::Internet.password,
                                    'email_verified' => false,
                                    'connection' => Auth0::Api::AuthenticationEndpoints::UP_AUTH,
                                    'app_metadata' => {})
    end
    let(:email_primary) { "#{entity_suffix}#{Faker::Internet.safe_email(Faker::Internet.user_name)}" }
    let!(:primary_user) do
      sleep 1
      client.create_user(username,  'email' => email_primary,
                                    'password' => Faker::Internet.password,
                                    'email_verified' => false,
                                    'connection' => Auth0::Api::AuthenticationEndpoints::UP_AUTH,
                                    'app_metadata' => {})
    end

    let(:body_link) { { 'provider' => 'auth0', 'user_id' => link_user['user_id'] } }
  end

end
