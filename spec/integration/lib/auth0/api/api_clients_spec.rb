require "spec_helper"
describe Auth0::Api::V1::Clients do

	let(:client) { Auth0Client.new(v1_creds) }
	let(:global_client) { Auth0Client.new(v1_global_creds) }
	
	it { expect(client.clients).to_not be_empty }
	it { expect {client.create_client("client")}.to raise_error(Auth0::Unauthorized) }
	it { expect(global_client.create_client("client")).to_not be_nil }
	pending { expect(global_client.create_client("clientWithCallback", callbacks: "https://localhost:3000, https://server.com/auth")).to_not be_nil }
	pending do
	 new_client = global_client.create_client("client_to_update")
	 expect(global_client.patch_client("updated_client", client_id: new_client["clientID"], callbacks: ""))
	end
end
