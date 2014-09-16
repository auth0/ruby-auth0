require 'test_helper'

class CallbackControllerTest < ActionController::TestCase
  test "should get store" do
    get :store
    assert_response :success
  end

  test "should get failure" do
    get :failure
    assert_response :success
  end

end
