require 'test_helper'

class PingControllerTest < ActionController::TestCase

  test 'responds with success' do
    get :ping
    assert_response :success
  end

end
