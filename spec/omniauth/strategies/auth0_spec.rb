require "spec_helper"

describe OmniAuth::Strategies::Auth0 do
  let(:app){ Rack::Builder.new do |b|
    b.use Rack::Session::Cookie, {:secret => "abc123"}
    b.run lambda{|env| [200, {}, ['Not Found']]}
  end.to_app }

  before :each do
    OmniAuth.config.test_mode = true
    @request = double('Request')
    @request.stub(:params) { {} }
    @request.stub(:cookies) { {} }
    @request.stub(:env) { {} }
  end

  after do
    OmniAuth.config.test_mode = false
  end

  subject do
    OmniAuth::Strategies::Auth0.new(app, :namespace => "tenny.auth0.com:3000").tap do |strategy|
      strategy.stub(:request) { @request }
    end
  end

  context "initiation" do
    it "uses the correct site" do
      subject.options.client_options.site.
        should == "https://tenny.auth0.com:3000"
    end

    it "uses the correct authorize_url" do
      subject.options.client_options.authorize_url.
        should == "https://tenny.auth0.com:3000/authorize"
    end

    it "uses the correct token_url" do
      subject.options.client_options.token_url.
        should == "https://tenny.auth0.com:3000/oauth/token"
    end
  end

  context "request phase" do
    before(:each){ get '/auth/auth0' }

    it "authenticate" do
      expect(last_response.status).to eq(200)
    end

    it "authorize params" do
      subject.stub(:request) { double('Request', {:params => { "connection" => "google-oauth2" }, :env => {}}) }
      subject.authorize_params.include?("connection").should == true
    end
  end
end