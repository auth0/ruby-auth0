require 'spec_helper'
describe Auth0::Api::AuthenticationEndpoints do
  attr_reader :client,
              :impersonate_user,
              :global_client,
              :password

  before(:all) do
    @client = Auth0Client.new(Credentials.v2_creds)
    @global_client = Auth0Client.new(v1_global_creds)

    impersonate_username = Faker::Internet.user_name
    impersonate_email = "#{entity_suffix}" \
      "#{Faker::Internet.safe_email(impersonate_username)}"
    @password = Faker::Internet.password
    @impersonate_user = client.create_user(
      impersonate_username,
      'email' => impersonate_email,
      'password' => password,
      'email_verified' => true,
      'connection' =>
      Auth0::Api::AuthenticationEndpoints::UP_AUTH,
      'app_metadata' => {}
    )
  end

  describe '.obtain_access_token' do
    let(:acces_token) { @global_client.obtain_access_token }
    it { expect(acces_token).to_not be_nil }
  end

  describe '.signup' do
    let(:signup_username) { Faker::Internet.user_name }
    let(:signup_email) {
      "#{entity_suffix}#{Faker::Internet.safe_email(signup_username)}"
    }
    let(:signup) { @global_client.signup(signup_email, @password) }
    it { expect(signup).to(include('_id', 'email')) }
    it { expect(signup['email']).to eq signup_email }
  end

  describe '.change_password' do
    let(:change_password) do
      @global_client.change_password(@impersonate_user['user_id'], '')
    end
    it do
      expect(@global_client.change_password(@impersonate_user['user_id'], ''))
        .to(include('We\'ve just sent you an email to reset your password.'))
    end
  end

  describe '.saml_metadata' do
    let(:saml_metadata) { @global_client.saml_metadata }
    it { expect(saml_metadata).to(include('<EntityDescriptor')) }
  end

  describe '.wsfed_metadata' do
    let(:wsfed_metadata) { @global_client.wsfed_metadata }
    it { expect(wsfed_metadata).to(include('<EntityDescriptor')) }
  end
end
