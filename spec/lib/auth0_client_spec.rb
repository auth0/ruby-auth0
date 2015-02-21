require "spec_helper"
describe Auth0Client do
  let(:subject){Auth0Client.new({})}
  before :each do
    allow_any_instance_of(Auth0::Api::AuthenticationEndpoints).to receive(:obtain_access_token)
  end
  it {expect(subject).to be_a Auth0::Client}
end
