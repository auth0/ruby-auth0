require "spec_helper"
describe Auth0::Api::V2::Users do

  let(:client) { Auth0Client.new(v2_creds) }
  let(:username) { Faker::Internet.user_name }
  let(:email) { Faker::Internet.safe_email("#{username}#{entity_suffix}") }
  let(:password) { Faker::Internet.password }
  let(:connection) { "Username-Password-Authentication" }
  let!(:user) { client.create_user(username, {
                                     "username" => username,
                                     "email" => email,
                                     "password" => password,
                                     "email_verified" => false,
                                     "connection" => connection,
                                     "app_metadata" => {}
  })}

  describe '.users' do

    let(:users) { client.users() }

    it { expect(users.size).to be > 0 }

    context "#filters" do
      it { expect(client.users(per_page: 1).size).to be 1 }
      it { expect(client.users(per_page: 1, fields: [:picture, :email, :user_id].join(',')).first).to include("email", "user_id", "picture") }
      it { expect(client.users(per_page: 1, fields: [:picture, :email, :user_id].join(','), exclude_fields: true).first).to_not include("email", "user_id", "picture") }
    end

  end

  describe '.user' do

    let(:subject) { client.user(user["user_id"]) }

    it { should include("email" => email, "name" => username) }

    context "#filters" do
      it { expect(client.user(user["user_id"], fields: [:picture, :email, :user_id].join(','))).to include("email", "user_id", "picture") }
      it { expect(client.user(user["user_id"], fields: [:picture, :email, :user_id].join(','), exclude_fields: true)).to_not include("email", "user_id", "picture") }
    end

  end

  describe '.create_user' do

    let(:subject) { user }

    it { should include("user_id", "identities") }
    it { should include(
           "username" => username,
           "email" => email,
           "email_verified" => false,
    )}

  end

  describe '.delete_user' do

    it { expect { client.delete_user user["user_id"] }.to_not raise_error }

    it { expect { client.delete_user "" }.to raise_error(Auth0::MissingUserId) }

  end

  describe '.patch_user' do
    it { expect(client.patch_user(user["user_id"], {"email_verified" => true})).to include("email_verified" => true) }
  end

end
