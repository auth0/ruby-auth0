require "spec_helper"
describe Auth0::Api::V1::Logs do
  before :all do
    dummy_instance = DummyClass.new
    dummy_instance.extend(Auth0::Api::V1::Logs)
    dummy_instance.extend(Auth0::Mixins::Initializer)
    @instance = dummy_instance
  end

  context ".logs or .search_logs" do
    it {expect(@instance).to respond_to(:logs)}
    it {expect(@instance).to respond_to(:search_logs)}
    it "should call path with all provided params per_page" do
      expect(@instance).to receive(:get).with("/api/logs?per_page=500")
      expect{@instance.logs("per_page" => 500)}.not_to raise_error
    end
    it "should call path with all provided params per_page, page" do
      expect(@instance).to receive(:get).with("/api/logs?per_page=500&page=3")
      expect{@instance.logs("per_page" => 500, page: 3)}.not_to raise_error
    end

    it "should raise warn if any garbage params are passed" do
      error_message = "random_stuff is not in acceptable params list: [:take, :from, :search_criteria, :page, :per_page, :sort, :fields, :exclude_fields]"
      expect(@instance).to receive(:warn).with(error_message)
      @instance.logs("per_page" => 500, page: 3, random_stuff:7 )
    end
  end

  context ".log" do
    it {expect(@instance).to respond_to :log}
    it "is expected to get '/api/logs/te st'" do
      expect(@instance).to receive(:get).with("/api/logs/te st")
      expect{@instance.log("te st")}.not_to raise_error
    end
  end

  context ".user_logs" do
    it {expect(@instance).to respond_to(:user_logs)}
    it "is expected to get /api/users/#user_id/logs" do
      expect(@instance).to receive(:get).with("/api/users/auth0|test test/logs?page=0&per_page=50")
      expect{@instance.user_logs("auth0|test test")}.not_to raise_error
    end
  end


end
