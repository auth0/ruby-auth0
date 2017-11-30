require 'spec_helper'
describe Auth0::Api::V2::Clients do
  let(:client) { Auth0Client.new(v2_creds) }
  let(:existing_client) { client.create_client("existing#{entity_suffix}") }
  let(:client_name) { "ClientV2#{entity_suffix}" }

  it { expect(client.clients).to_not be_empty }

  describe '.clients' do
    let(:clients) { client.clients }

    it { expect(clients.size).to be > 0 }

    context '#filters' do
      it do
        expect(client.clients(fields: [:name, :callbacks].join(',')).first).to(include('name', 'callbacks'))
      end
      it do
        expect(client.clients(fields: [:callbacks].join(',')).first).to_not(include('name'))
      end
      it do
        expect(client.clients(fields: [:callbacks].join(','), include_fields: false).first).to_not(include('callbacks'))
      end
    end
  end

  describe '.client' do
    it { expect(client.client(existing_client['client_id'])).to include('client_id' => existing_client['client_id']) }
    it { expect { client.client '' }.to raise_error(Auth0::MissingClientId) }

    context '#filters' do
      let(:client_include) do
        client.client(existing_client['client_id'], fields: [:name, :client_secret, :jwt_configuration].join(','))
      end
      let(:client_not_include) do
        client.client(existing_client['client_id'], fields: :jwt_configuration, include_fields: false)
      end

      it do
        expect(client_include).to(include('name', 'client_secret', 'jwt_configuration'))
      end

      it do
        expect(client_not_include).to(include('name', 'client_secret'))
        expect(client_not_include).to_not(include('jwt_configuration'))
      end
    end
  end

  describe '.create_client' do
    it do
      expect(client.create_client(client_name, custom_login_page_on: false)).to(
        include('name' => client_name, 'custom_login_page_on' => false)
      )
    end
    it { expect { client.create_client('', custom_login_page_on: false) }.to raise_error(Auth0::MissingParameter) }
  end

  describe '.patch_client' do
    it do
      expect(
        client.patch_client(
          existing_client['client_id'],
          custom_login_page_on: false,
          sso: true
        )
      ).to(include('custom_login_page_on' => false, 'sso' => true))
    end
    it { expect { client.patch_client('', custom_login_page_on: false) }.to raise_error(Auth0::MissingClientId) }
  end

  describe '.delete_rule' do
    it { expect { client.delete_client(existing_client['client_id']) }.to_not raise_error }
    it { expect { client.delete_client '' }.to raise_error(Auth0::MissingClientId) }
  end
end
