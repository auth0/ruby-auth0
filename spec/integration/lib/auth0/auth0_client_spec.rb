require "spec_helper"
describe Auth0::Client do

  shared_examples "invalid credentials" do |credentials, error|
    it "raise an error with credentials #{credentials}" do
      if error.nil?
        expect { Auth0Client.new(credentials) }.to raise_error
      else
        expect { Auth0Client.new(credentials) }.to raise_error(error)
      end
    end
  end

  it_should_behave_like "invalid credentials", {namespace: "samples.auth0.com"}, Auth0::InvalidCredentials
  it_should_behave_like "invalid credentials", {namespace: "samples.auth0.com", client_id: "client_id"}, Auth0::InvalidCredentials
  it_should_behave_like "invalid credentials", {namespace: "samples.auth0.com", client_secret: "secret"}, Auth0::InvalidCredentials
  it_should_behave_like "invalid credentials", {namespace: "samples.auth0.com", api_version: 2}, Auth0::InvalidCredentials
  it_should_behave_like "invalid credentials", {}
  it_should_behave_like "invalid credentials", {api_version: 2}
  it_should_behave_like "invalid credentials", {api_version: 1}
  it_should_behave_like "invalid credentials", {client_id: "client_id", client_secret: "secret"}, Auth0::InvalidApiNamespace
  it_should_behave_like "invalid credentials", {api_version: 2, token: "token"}, Auth0::InvalidApiNamespace

  let(:valid_v1_credentials) { {client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"], domain: ENV["DOMAIN"]} }
  let(:token) { ENV["MASTER_JWT"] }
  let(:v2_credentials) { {domain: ENV["DOMAIN"], api_version: 2} }

  shared_examples "valid credentials" do
    it { expect { Auth0Client.new(credentials) }.to_not raise_error }
  end

  it_should_behave_like "valid credentials" do
    let(:credentials) { valid_v1_credentials }
  end
  it_should_behave_like "valid credentials" do
    let(:credentials) { valid_v1_credentials.merge({api_version: 1}) }
  end
  it_should_behave_like "valid credentials" do
    let(:credentials) { v2_credentials.merge({token: token})}
  end
  it_should_behave_like "valid credentials" do
    let(:credentials) { v2_credentials.merge({access_token: ENV["MASTER_JWT"]}) }
  end

  context "client headers" do
    let(:client) { Auth0::Client.new(v2_credentials.merge({access_token: 'abc123', domain: 'myhost.auth0.com'})) }
    let(:headers) { client.class.headers }

    it "has the correct headers present" do
      headers.keys.sort.should eql ['Authorization', 'Content-Type', 'User-Agent', 'X-Auth0-Client']
    end

    it "uses the correct access token" do
      headers['Authorization'].should eql "Bearer abc123"
    end

    it "is always json" do
      headers['Content-Type'] = 'application/json'
    end

    it "sets the ruby version" do
      headers['User-Agent'].should eql "Ruby/#{RUBY_VERSION}"
    end

    it "sets the client version" do
      headers['X-Auth0-Client'].should eql Auth0::VERSION
    end
  end
end
