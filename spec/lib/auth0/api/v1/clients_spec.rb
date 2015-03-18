require "spec_helper"
describe Auth0::Api::V1::Clients do
  before :all do
    dummy_instance = DummyClass.new
    dummy_instance.extend(Auth0::Api::V1::Clients)
    @instance = dummy_instance
  end

  context ".clients" do
    it {expect(@instance).to respond_to(:clients)}
    it "is expected to send get request to /api/clients" do
      expect(@instance).to receive(:get).with("/api/clients")
      expect{@instance.clients}.not_to raise_error
    end
  end

  context ".create_client" do
    it {expect(@instance).to respond_to(:create_client)}
    it "is expected to send post request to /api/clients" do
      client_name = "ClientRandomName"
      callbacks = "Some absolutely random stuff here"
      expect(@instance).to receive(:post).with("/api/clients",{name: client_name, callbacks: callbacks})
      expect{@instance.create_client(client_name, callbacks)}.not_to raise_error
    end
  end

  context ".create_client" do
    it {expect(@instance).to respond_to(:create_client)}
    it "is expected to send post request to /api/clients" do
      client_name = "Some random name"
      callbacks =   "Some random stuff"
      expect(@instance).to receive(:post).with("/api/clients",{name: client_name, callbacks: callbacks})
      expect{@instance.create_client(client_name, callbacks)}.not_to raise_error
    end
  end

  context ".update_client" do
    it {expect(@instance).to respond_to(:update_client)}
    it "is expected to perform put to /api/clients/#client_id" do
      client_name = "Some random name"
      callbacks =   "Some random stuff"
      expect(@instance).to receive(:put).with("/api/clients/client_id",{name: client_name, callbacks: callbacks})
      expect{@instance.update_client(client_name, callbacks, "client_id")}.not_to raise_error
    end

    it "is expected to make warn on deprecated endpoint" do
      expect(@instance).to receive(:warn).with("This endpoint has been deprecated in favor of PATCH.")
      @instance.update_client("test")
    end
  end

  context ".patch_client" do
    it {expect(@instance).to respond_to(:patch_client)}
    it "is expected to perform patch to /api/clients/#client_id" do
      client_name = "Some random name"
      callbacks =   "Some random stuff"
      expect(@instance).to receive(:patch).with("/api/clients/client_id",{name: client_name, callbacks: callbacks})
      expect{@instance.patch_client(client_name, callbacks, "client_id")}.not_to raise_error
    end
  end

end
