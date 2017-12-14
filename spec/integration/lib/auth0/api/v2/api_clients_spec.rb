require 'spec_helper'
describe Auth0::Api::V2::Clients do
  let(:client) { Auth0Client.new(v2_creds) }
  let(:existing_client) do
    sleep 1
    client.create_client("existing#{entity_suffix}")
  end
  let(:client_name) { "ClientV2#{entity_suffix}" }

  it do
    sleep 1
    expect(client.clients).to_not be_empty
  end

  describe '.clients' do
    let(:clients) do
      sleep 1
      client.clients
    end

    it do
      sleep 1
      expect(clients.size).to be > 0
    end

    context '#filters' do
      it do
        sleep 1
        expect(client.clients(fields: [:name, :callbacks].join(',')).first).to(include('name', 'callbacks'))
      end
      it do
        sleep 1
        expect(client.clients(fields: [:callbacks].join(',')).first).to_not(include('name'))
      end
      it do
        sleep 1
        expect(client.clients(fields: [:callbacks].join(','), include_fields: false).first).to_not(include('callbacks'))
      end
    end
  end

  describe '.client' do
    it do
      sleep 1
      expect(client.client(existing_client['client_id'])).to include('client_id' => existing_client['client_id'])
    end
    it do
      sleep 1
      expect { client.client '' }.to raise_error(Auth0::MissingClientId)
    end

    context '#filters' do
      let(:client_include) do
        sleep 1
        client.client(existing_client['client_id'], fields: [:name, :client_secret, :jwt_configuration].join(','))
      end
      let(:client_not_include) do
        sleep 1
        client.client(existing_client['client_id'], fields: :jwt_configuration, include_fields: false)
      end

      it do
        sleep 1
        expect(client_include).to(include('name', 'client_secret', 'jwt_configuration'))
      end

      it do
        sleep 1
        expect(client_not_include).to(include('name', 'client_secret'))
        expect(client_not_include).to_not(include('jwt_configuration'))
      end
    end
  end

  describe '.create_client' do
    it do
      sleep 1
      expect(client.create_client(client_name, custom_login_page_on: false)).to(
        include('name' => client_name, 'custom_login_page_on' => false)
      )
    end
    it { expect { client.create_client('', custom_login_page_on: false) }.to raise_error(Auth0::MissingParameter) }
  end

  describe '.patch_client' do
    it do
      sleep 1
      expect(
        client.patch_client(
          existing_client['client_id'],
          custom_login_page_on: false,
          sso: true
        )
      ).to(include('custom_login_page_on' => false, 'sso' => true))
    end
    it do
      sleep 1
      expect { client.patch_client('', custom_login_page_on: false) }.to raise_error(Auth0::MissingClientId)
    end
  end

  describe '.delete_rule' do
    it do
      sleep 1
      expect { client.delete_client(existing_client['client_id']) }.to_not raise_error
    end
    it do
      sleep 1
      expect { client.delete_client '' }.to raise_error(Auth0::MissingClientId)
    end
  end
end
