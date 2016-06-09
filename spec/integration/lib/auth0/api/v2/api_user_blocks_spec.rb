require 'spec_helper'
describe Auth0::Api::V2::UserBlocks do
  attr_reader :client, :user, :email

  skip "User blocks examples are skipped since is #logins exceeds free tenant limits" do
    before(:all) do
      @client = Auth0Client.new(v2_creds)
      username = Faker::Internet.user_name
      @email = "#{entity_suffix}#{Faker::Internet.safe_email(username)}"
      password = Faker::Internet.password
      @user = client.create_user(username,  'email' => email,
                                            'password' => password,
                                            'email_verified' => true,
                                            'connection' => Auth0::Api::AuthenticationEndpoints::UP_AUTH,
                                            'app_metadata' => {})
      100.times do
        begin
          client.login(email, 'invalid password')
        rescue Auth0::Unauthorized
          next
        rescue Auth0::Unsupported => e
          puts e.message
          break
        end
      end
    end

    after(:all) do
      client.delete_user(user['user_id'])
    end

    describe '.user_blocks' do
      let(:user_blocks) { client.user_blocks(email) }
      it { expect(user_blocks['blocked_for'].size).to be > 0 }
      it { expect(user_blocks['blocked_for'].first['identifier']).to eq email }
    end

    describe '.user_blocks_by_id' do
      let(:user_blocks) { client.user_blocks_by_id(user['user_id']) }
      it { expect(user_blocks['blocked_for'].size).to be > 0 }
      it { expect(user_blocks['blocked_for'].first['identifier']).to eq email }
    end

    describe '.delete_user_blocks' do
      let(:user_blocks) do
        client.delete_user_blocks(email)
        client.user_blocks(email)
      end
      it { expect(user_blocks['blocked_for']).to eq [] }
    end

    describe '.delete_user_blocks_by_id' do
      let(:user_blocks) do
        client.delete_user_blocks_by_id(user['user_id'])
        client.user_blocks(email)
      end
      it { expect(user_blocks['blocked_for']).to eq [] }
    end
  end
end
