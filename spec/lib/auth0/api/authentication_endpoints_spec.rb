require "spec_helper"
describe Auth0::Api::AuthenticationEndpoints do
  before :all do
    dummy_instance = DummyClass.new
    dummy_instance.extend(Auth0::Api::AuthenticationEndpoints)
    @instance = dummy_instance
  end

  context ".obtain_access_token" do
    it {expect(@instance).to respond_to(:obtain_access_token)}
    it "is expected to make post request to '/oauth/token'" do
      allow(@instance).to receive(:post).with("/oauth/token", {client_id: nil, client_secret: nil, grant_type: 'client_credentials'}).
        and_return({"access_token" => "AccessToken"})
      expect(@instance).to receive(:post).with("/oauth/token", {client_id: nil, client_secret: nil, grant_type: 'client_credentials'})
      expect(@instance.obtain_access_token).to eql "AccessToken"
    end
  end

  context ".delegation" do
    it {expect(@instance).to respond_to(:delegation)}
    it "is expected to make post request to '/delegation'" do
      expect(@instance).to receive(:post).with("/delegation",{:client_id=>nil, :grant_type=>"urn:ietf:params:oauth:grant-type:jwt-bearer", :id_token=>"token", :target=>"target", :scope=>"", api_type: "app"})
      @instance.delegation("token", "target", "")
    end
    it "is expected to make post request to '/delegation' with specified api_type" do
      expect(@instance).to receive(:post).with("/delegation",{:client_id=>nil, :grant_type=>"urn:ietf:params:oauth:grant-type:jwt-bearer", 
                                                              :id_token=>"", :target=>"", :scope=>"", 
                                                              api_type: "salesforce_api"})
      @instance.delegation("", "", "", "salesforce_api")
    end
  end

  context ".login" do
    it {expect(@instance).to respond_to(:signup)}
    it "is expected to make post to /oauth/ro" do
      expect(@instance).to receive(:post).with("/oauth/ro", {client_id: nil, username:"test@test.com", password: "password", connection: "Username-Password-Authentication", scope: "openid", grant_type: "password", id_token: nil})
      @instance.login("test@test.com", "password")
    end
  end
  context ".signup" do
    it {expect(@instance).to respond_to(:signup)}
    it "is expected to make post to /dbconnections/signup" do
      expect(@instance).to receive(:post).with("/dbconnections/signup", {client_id: nil, email: "test@test.com", password: "password", connection: "User"})
      @instance.signup("test@test.com", "password", "User")
    end
  end
  context ".change_password" do
    it {expect(@instance).to respond_to(:change_password)}
    it "is expected to make post to /dbconnections/change_password" do
      expect(@instance).to receive(:post).with("/dbconnections/change_password", {client_id: nil, email: "test@test.com", password: "password", connection: "User"})
      @instance.change_password("test@test.com", "password", "User")
    end
  end

  context ".token_info" do
    it {expect(@instance).to respond_to(:token_info)}
    it "is expected to make post to /tokeinfo" do
      expect(@instance).to receive(:post).with("/tokeninfo", {id_token: "SomerandomToken"})
      @instance.token_info("SomerandomToken")
    end
  end
end
