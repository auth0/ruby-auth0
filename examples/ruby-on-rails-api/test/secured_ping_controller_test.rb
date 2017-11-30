require 'test_helper'
# Secure Ping Controller Test
class SecuredPingControllerTest < ActionController::TestCase
  def with_a_valid_token
    @user = { id: 1 }
    @token = Knock::AuthToken.new(payload: { sub: @user[:id] }).token
    @request.env['HTTP_AUTHORIZATION'] = "Bearer #{@token}"
  end

  test 'responds with unauthorized' do
    get :ping
    assert_response :unauthorized
  end

  test 'responds with success when passing a valid token' do
    with_a_valid_token
    get :ping
    assert_response :success
  end

  test '@current_user is set when passing a valid token' do
    with_a_valid_token
    get :ping
    assert_equal @user[:id], @controller.current_user[:id]
  end
end
