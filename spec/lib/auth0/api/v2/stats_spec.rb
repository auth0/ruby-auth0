require "spec_helper"
describe Auth0::Api::V2::Stats do
  before :all do
    dummy_instance = DummyClass.new
    dummy_instance.extend(Auth0::Api::V2::Stats)
    @instance = dummy_instance
  end
  context ".active_users" do
    it{expect(@instance).to respond_to(:active_users)}
    it "expect client to send get to /api/v2/stats/active-users" do
      expect(@instance).to receive(:get).with("/api/v2/stats/active-users")
      expect{@instance.active_users}.not_to raise_error
    end
  end
  context ".daily_stats" do
    it{expect(@instance).to respond_to(:daily_stats)}
    it "expect client to send get to /api/v2/stats/daily" do
      expect(@instance).to receive(:get).with("/api/v2/stats/daily", {from: "20120222", to: "20151222"})
      expect{@instance.daily_stats("20120222","20151222")}.not_to raise_error
    end
  end
end
