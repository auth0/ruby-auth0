require 'test_helper'
# Ping Controller Tests
class PingControllerTest < ActionController::TestCase
  test 'responds with success' do
    get :ping
    assert_response :success
  end
end
