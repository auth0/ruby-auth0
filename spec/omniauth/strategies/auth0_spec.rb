require "spec_helper"

describe OmniAuth::Strategies::Auth0 do
  subject do
    OmniAuth::Strategies::Auth0.new({:namespace => "tenny.auth0.com:3000"})
  end

  context "initiation" do
    it "uses the correct authorize_url" do
      subject.options.client_options.authorize_url.
        should == "https://tenny.auth0.com:3000/authorize"
    end
  end
end