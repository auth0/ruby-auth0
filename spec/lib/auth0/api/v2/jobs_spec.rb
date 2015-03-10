require "spec_helper"
describe Auth0::Api::V2::Jobs do
  before :all do
    dummy_instance = DummyClass.new
    dummy_instance.extend(Auth0::Api::V2::Jobs)
    @instance = dummy_instance
  end
  context ".get_job" do
    it{expect(@instance).to respond_to(:get_job)}
    it "expect client to send get to /api/v2/stats/jobs/3" do
      expect(@instance).to receive(:get).with("/api/v2/jobs/3")
      expect{@instance.get_job(3)}.not_to raise_error
    end
  end
  context ".daily_stats" do
    it{expect(@instance).to respond_to(:create_job)}
    it "expect client to send get to /api/v2/stats/daily" do
      expect{@instance.create_job("file_name","name")}.to raise_error(NotImplementedError)
    end
  end
end
