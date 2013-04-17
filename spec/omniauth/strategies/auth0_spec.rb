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

  context "info" do
    before :each do
      @raw_info = {
        "_id" => "165dabb5140ee2cc66b5137912ccd760",
        "email" => "user@mail.com",
        "family_name" => "LastName",
        "gender" => "male",
        "given_name" => "FirstName",
        "identities" => [
          {
            "access_token" => "ya29.AHES6ZRPK1Skc_rtB30Em_5RkZlKez3FkktcmJ_0RX5fIkCbkOCrXA",
            "provider" => "google-oauth2",
            "user_id" => "102835921788417079450",
            "connection" => "google-oauth2",
            "isSocial" => true
          }
        ],
        "locale" => "en",
        "name" => "FirstName LastName",
        "nickname" => "nick",
        "picture" => "pic",
        "user_id" => "google-oauth2|102835921788417079450"
      }
      subject.stub(:raw_info) { @raw_info }
    end

    it 'returns the email' do
      subject.info[:email].should eq('user@mail.com')
    end

    it 'returns the family name' do
      subject.info[:family_name].should eq('LastName')
    end

    it 'returns the given name' do
      subject.info[:given_name].should eq('FirstName')
    end

    it 'returns the gender' do
      subject.info[:gender].should eq('male')
    end

    it 'returns the locale' do
      subject.info[:locale].should eq('en')
    end

    it 'returns the name' do
      subject.info[:name].should eq('FirstName LastName')
    end

    it 'returns the picture' do
      subject.info[:picture].should eq('pic')
    end

    it 'returns the user_id' do
      subject.info[:user_id].should eq('google-oauth2|102835921788417079450')
    end
  end
end