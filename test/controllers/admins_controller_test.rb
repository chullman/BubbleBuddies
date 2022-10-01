require "test_helper"

class AdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_index_url
    assert_response :success
  end

  test "should get edit_permissions" do
    get admins_edit_permissions_url
    assert_response :success
  end
end
