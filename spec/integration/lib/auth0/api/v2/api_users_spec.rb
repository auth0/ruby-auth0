require 'spec_helper'
describe Auth0::Api::V2::Users do
  let(:client) { Auth0Client.new(v2_creds) }
  let(:test_user_name) { "#{entity_suffix}-username" }
  let(:test_user_email) { "#{entity_suffix}-#{test_user_name}@auth0.com" }
  let(:test_user) do
    VCR.use_cassette(
      'Auth0_Api_V2_Users/create_test_user'
    ) do
      client.create_user(
        test_user_name,
        'email' => test_user_email,
        'password' => Faker::Internet.password,
        'connection' => Auth0::Api::AuthenticationEndpoints::UP_AUTH
      )
    end
  end

  describe '.create_user', vcr: true do
    it 'should return the created user' do
      expect(test_user).to include('user_id', 'email', 'email_verified', 'name')
      expect(test_user).to include(
        'email' => test_user_email,
        'name' => test_user_name,
        'email_verified' => false
      )
    end
  end

  describe '.users', vcr: true do
    let(:users) do
      client.users
    end

    it 'should have at least one user' do
      expect(users.size).to be > 0
    end

    context '#filters' do
      it 'should return the correct number of results when paginated' do
        expect(client.users(per_page: 1).size).to be 1
      end

      it 'should include the indicated fields when paginated' do
        expect(
          client.users(
            per_page: 1,
            fields: %i[picture email user_id].join(','),
            include_fields: true
          ).first
        ).to(include('email', 'user_id', 'picture'))
      end

      it 'should not include other fields when paginated' do
        expect(
          client.users(
            per_page: 1,
            fields: [:email].join(',')
          ).first
        ).to_not include('user_id', 'picture')
      end

      it 'should exclude the indicated fields when paginated' do
        expect(
          client.users(
            per_page: 1,
            fields: [:email].join(','),
            include_fields: false
          ).first
        ).to include('user_id', 'picture')
      end

      it 'is expected to find a user with a v2 search engine query' do
        expect(
          client.users(
            per_page: 1,
            fields: 'user_id',
            q: 'updated_at:{2016-01-01 TO *}',
            search_engine: 'v2'
          ).first
        ).to include('user_id')
      end

      it 'is expected to find a user with a v3 search engine query' do
        expect(
          client.users(
            per_page: 1,
            fields: 'user_id',
            q: 'updated_at:[2016-01-01 TO *]',
            search_engine: 'v3'
          ).first
        ).to include('user_id')
      end
    end
  end

  describe '.user', vcr: true do
    it 'should retrieve the created user' do
      expect(
        client.user(test_user['user_id'])
      ).to include(
        'email' => test_user_email,
        'name' => test_user_name
      )
    end

    context '#filters' do
      it 'should include the fields indicated' do
        expect(
          client.user(
            test_user['user_id'],
            fields: %i[picture email user_id].join(','),
            include_fields: true
          )
        ).to include('email', 'user_id', 'picture')
      end

      it 'should exclude the fields indicated' do
        expect(
          client.user(
            test_user['user_id'],
            fields: %i[picture email user_id].join(','),
            include_fields: false
          )
        ).not_to include('picture', 'email', 'user_id')
      end

      it 'should exclude fields not indicated' do
        expect(
          client.user(
            test_user['user_id'],
            fields: [:email].join(',')
          )
        ).to_not include('user_id', 'picture')
      end
    end
  end

  describe '.patch_user', vcr: true do
    let(:patch_user_body) do
      {
        'user_metadata' => {
          'addresses' => { 'home_address' => '742 Evergreen Terrace' }
        }
      }
    end

    it 'should raise an error when the user_id is missing' do
      expect { client.patch_user('', {}) }.to raise_error Auth0::MissingUserId
    end

    it 'should raise an error when the body is missing' do
      expect do
        client.patch_user(test_user['user_id'], {})
      end.to raise_error Auth0::InvalidParameter
    end

    it 'should patch email_verified and return the updated data' do
      expect(
        client.patch_user(
          test_user['user_id'],
          'email_verified' => true
        )
      ).to include('email_verified' => true)
    end

    it 'should patch user_metadata and return the updated user' do
      expect(
        client.patch_user(test_user['user_id'], patch_user_body)
      ).to include(patch_user_body)
    end
  end

  describe '.delete_user', vcr: true do
    it 'should raise an error when the user_id is missing' do
      expect { client.delete_user '' }.to raise_error Auth0::MissingUserId
    end

    it 'should delete the user successfully' do
      expect { client.delete_user test_user['user_id'] }.to_not raise_error
    end
  end
end
