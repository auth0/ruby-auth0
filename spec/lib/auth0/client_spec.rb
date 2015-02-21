require "spec_helper"
describe Auth0::Client do
  context "V1 modules to be included" do
    let(:subject){Auth0::Client.new({})}
    before :each do
      allow_any_instance_of(Auth0::Api::AuthenticationEndpoints).to receive(:obtain_access_token)
    end
    it {expect(subject).to be_a HTTParty}
    it {expect(subject).to be_a Auth0::Mixins}
    it {expect(subject).to be_a Auth0::Mixins::Initializer}
    it {expect(subject).to be_a Auth0::Api::V1}
    it {expect(subject).to be_a Auth0::Api::V1::Users}
    it {expect(subject).to be_a Auth0::Api::V1::Connections}
    it {expect(subject).to be_a Auth0::Api::V1::Clients}
    it {expect(subject).to be_a Auth0::Api::V1::Rules}
    it {expect(subject).to be_a Auth0::Api::V1::Logs}
    it {expect(subject).to be_a Auth0::Api::AuthenticationEndpoints}
    it {expect(subject).not_to be_a Auth0::Api::V2}
    it {expect(subject).not_to be_a Auth0::Api::V2::Clients}
    it {expect(subject).not_to be_a Auth0::Api::V2::Users}
  end
  context "V2 modules to be included" do
    let(:subject){Auth0::Client.new({protocols: "v2"})}
    before :each do
      expect_any_instance_of(Auth0::Api::AuthenticationEndpoints).not_to receive(:obtain_access_token)
    end
    it {expect(subject).to be_a HTTParty}
    it {expect(subject).to be_a Auth0::Mixins}
    it {expect(subject).to be_a Auth0::Mixins::Initializer}
    it {expect(subject).to be_a Auth0::Api::V2}
    it {expect(subject).to be_a Auth0::Api::V2::Clients}
    it {expect(subject).to be_a Auth0::Api::V2::Users}
    it {expect(subject).not_to be_a Auth0::Api::V1}
    it {expect(subject).not_to be_a Auth0::Api::V1::Users}
    it {expect(subject).not_to be_a Auth0::Api::V1::Connections}
    it {expect(subject).not_to be_a Auth0::Api::V1::Clients}
    it {expect(subject).not_to be_a Auth0::Api::V1::Rules}
    it {expect(subject).not_to be_a Auth0::Api::V1::Logs}
    it {expect(subject).not_to be_a Auth0::Api::AuthenticationEndpoints}
  end
end
