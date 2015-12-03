require 'spec_helper'
describe Auth0::Api::V2::Clients do
  let(:client) { Auth0Client.new(v2_creds) }
  let(:existing_client) { client.create_client("existing#{entity_suffix}") }
  let(:client_name) { "ClientV2#{entity_suffix}" }

  it { expect(client.clients).to_not be_empty }

  it do
    expect(client.create_client(client_name, custom_login_page_on: false)).to(
      include('name' => client_name, 'custom_login_page_on' => false))
  end

  it do
    expect(
      client.patch_client(
        existing_client['client_id'],
        custom_login_page_on: false,
        sso: true)).to(include('custom_login_page_on' => false, 'sso' => true))
  end

  it { expect { client.delete_client(existing_client['client_id']) }.to_not raise_error }

  it { expect(client.client(existing_client['client_id'])).to include('client_id' => existing_client['client_id']) }
end
