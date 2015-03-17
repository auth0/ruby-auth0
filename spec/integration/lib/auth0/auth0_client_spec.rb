require "spec_helper"
describe Auth0Client do
	it { expect { Auth0Client.new({}) }.to raise_error(SocketError) }
end