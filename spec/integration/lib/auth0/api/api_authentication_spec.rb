require 'spec_helper'
describe Auth0::Api::AuthenticationEndpoints do
  attr_reader :client, :impersonate_user, :impersonator_user, :global_client, :password

  before(:all) do
    @client = Auth0Client.new(v2_creds)
    impersonate_username = Faker::Internet.user_name
    impersonate_email = "#{entity_suffix}#{Faker::Internet.safe_email(impersonate_username)}"
    @password = Faker::Internet.password
    @impersonate_user = client.create_user(impersonate_username, 'email' => impersonate_email,
                                                                 'password' => password,
                                                                 'email_verified' => true,
                                                                 'connection' =>
                                                                  Auth0::Api::AuthenticationEndpoints::UP_AUTH,
                                                                 'app_metadata' => {})

    impersonator_username = Faker::Internet.user_name
    impersonator_email = "#{entity_suffix}#{Faker::Internet.safe_email(impersonator_username)}"
    @impersonator_user = client.create_user(impersonator_username, 'email' => impersonator_email,
                                                                   'password' => password,
                                                                   'email_verified' => true,
                                                                   'connection' =>
                                                                    Auth0::Api::AuthenticationEndpoints::UP_AUTH,
                                                                   'app_metadata' => {})

    @global_client = Auth0Client.new(v1_global_creds)
  end

  after(:all) do
    client.delete_user(impersonate_user['user_id'])
    client.delete_user(impersonator_user['user_id'])
  end

  describe '.obtain_access_token' do
    let(:acces_token) { global_client.obtain_access_token }
    it { expect(acces_token).to_not be_nil }
  end

  describe '.login' do
    let(:login) { global_client.login(impersonate_user['email'], password) }
    it { expect(login).to(include('id_token', 'access_token', 'token_type')) }
  end

  describe '.signup' do
    let(:signup_username) { Faker::Internet.user_name }
    let(:signup_email) { "#{entity_suffix}#{Faker::Internet.safe_email(signup_username)}" }
    let(:signup) { global_client.signup(signup_email, password) }
    it { expect(signup).to(include('_id', 'email')) }
    it { expect(signup['email']).to eq signup_email }
  end

  describe '.change_password' do
    let(:change_password) do
      global_client.change_password(impersonate_user['user_id'], password)
    end
    it { expect(change_password).to eq '"We\'ve just sent you an email to reset your password."' }
  end

  skip '.start_passwordless_email_flow' do
    let(:start_passwordless_email_flow) do
      global_client.start_passwordless_email_flow(impersonate_user['email'])
    end
    it { expect(start_passwordless_email_flow['email']).to eq impersonate_user['email'] }
    it { expect(start_passwordless_email_flow).to(include('_id', 'email')) }
  end

  skip '.start_passwordless_sms_flow' do
    let(:phone_number) { '+19143686854' }
    let(:start_passwordless_sms_flow) { global_client.start_passwordless_sms_flow(phone_number) }
    it { expect(start_passwordless_sms_flow['phone_number']).to eq phone_number }
    it { expect(start_passwordless_sms_flow).to(include('_id', 'phone_number', 'request_language')) }
  end

  describe '.saml_metadata' do
    let(:saml_metadata) { global_client.saml_metadata }
    it { expect(saml_metadata).to(include('<EntityDescriptor')) }
  end

  describe '.wsfed_metadata' do
    let(:wsfed_metadata) { global_client.wsfed_metadata }
    it { expect(wsfed_metadata).to(include('<EntityDescriptor')) }
  end

  describe '.token_info' do
    let(:id_token) { global_client.login(impersonate_user['email'], password)['id_token'] }
    let(:token_info) { global_client.token_info(id_token) }
    it { expect(token_info).to(include('email', 'clientID', 'global_client_id')) }
  end

  describe '.delegation' do
    let(:id_token) { global_client.login(impersonate_user['email'], password)['id_token'] }
    let(:target) { global_client.clients[0]['clientID'] }
    let(:delegation) { global_client.delegation(id_token, target) }
    it { expect(delegation).to(include('token_type', 'expires_in', 'id_token')) }
  end

  describe '.impersonation' do
    let(:impersonate_url) do
      global_client.impersonate(impersonate_user['user_id'], ENV['CLIENT_ID'], impersonator_user['user_id'], {})
    end
    it { expect(impersonate_url).to_not be_nil }
  end

  describe '.unlink_user' do
    let(:access_token) { global_client.login(impersonate_user['email'], password)['access_token'] }
    let(:unlink_user) { global_client.unlink_user(access_token, impersonator_user['user_id']) }
    it { expect(unlink_user).to eq 'OK' }
  end

  describe '.user_info' do
    let(:access_token) { global_client.login(impersonate_user['email'], password)['access_token'] }
    let(:credentials) { { client_id: ENV['CLIENT_ID'], token: access_token, domain: ENV['DOMAIN'] } }
    let(:client) { Auth0Client.new(credentials) }
    let(:user_info) { client.user_info }
    it { expect(user_info['email']).to eq impersonate_user['email'] }
    it { expect(user_info).to(include('clientID', 'identities', 'nickname', 'picture')) }
  end
end
