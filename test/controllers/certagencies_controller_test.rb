require "test_helper"

class CertagenciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @certagency = certagencies(:one)
  end

  test "should get index" do
    get certagencies_url
    assert_response :success
  end

  test "should get new" do
    get new_certagency_url
    assert_response :success
  end

  test "should create certagency" do
    assert_difference('Certagency.count') do
      post certagencies_url, params: { certagency: { cert_agency: @certagency.cert_agency } }
    end

    assert_redirected_to certagency_url(Certagency.last)
  end

  test "should show certagency" do
    get certagency_url(@certagency)
    assert_response :success
  end

  test "should get edit" do
    get edit_certagency_url(@certagency)
    assert_response :success
  end

  test "should update certagency" do
    patch certagency_url(@certagency), params: { certagency: { cert_agency: @certagency.cert_agency } }
    assert_redirected_to certagency_url(@certagency)
  end

  test "should destroy certagency" do
    assert_difference('Certagency.count', -1) do
      delete certagency_url(@certagency)
    end

    assert_redirected_to certagencies_url
  end
end
