require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new_diver" do
    get users_new_diver_url
    assert_response :success
  end

  test "should get new_skipper" do
    get users_new_skipper_url
    assert_response :success
  end

  test "should get new_instructor" do
    get users_new_instructor_url
    assert_response :success
  end

end
