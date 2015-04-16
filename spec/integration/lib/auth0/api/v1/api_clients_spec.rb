require "spec_helper"
describe Auth0::Api::V1::Clients do

  let(:client) { Auth0Client.new(v1_creds) }
  let(:global_client) { Auth0Client.new(v1_global_creds) }

  it { expect(client.clients).to_not be_empty }

  it { expect {client.create_client("client")}.to raise_error(Auth0::Unauthorized) }

  it { expect(global_client.create_client("client")).to_not be_nil }

end
