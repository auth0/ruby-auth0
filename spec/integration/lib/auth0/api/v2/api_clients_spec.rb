require "spec_helper"
describe Auth0::Api::V2::Clients do

  let(:client) { Auth0Client.new(v2_creds) }
  let(:existing_client) { client.create_client("existing") }
  
  it { expect(client.clients).to_not be_empty }

  it { expect(client.create_client("ClientV2", {custom_login_page_off: true})).to include("name" => "ClientV2", "custom_login_page_off" => true) }

  it { expect(client.patch_client(existing_client["client_id"], {custom_login_page_off: true, sso: true})).to include("custom_login_page_off" => true, "sso" => true) }

  it { expect { client.delete_client(existing_client["client_id"]) }.to_not raise_error }

end
