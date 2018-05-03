require 'test_helper'

class CertAgenciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cert_agency = cert_agencies(:one)
  end

  test "should get index" do
    get cert_agencies_url
    assert_response :success
  end

  test "should get new" do
    get new_cert_agency_url
    assert_response :success
  end

  test "should create cert_agency" do
    assert_difference('CertAgency.count') do
      post cert_agencies_url, params: { cert_agency: { cert_agency: @cert_agency.cert_agency } }
    end

    assert_redirected_to cert_agency_url(CertAgency.last)
  end

  test "should show cert_agency" do
    get cert_agency_url(@cert_agency)
    assert_response :success
  end

  test "should get edit" do
    get edit_cert_agency_url(@cert_agency)
    assert_response :success
  end

  test "should update cert_agency" do
    patch cert_agency_url(@cert_agency), params: { cert_agency: { cert_agency: @cert_agency.cert_agency } }
    assert_redirected_to cert_agency_url(@cert_agency)
  end

  test "should destroy cert_agency" do
    assert_difference('CertAgency.count', -1) do
      delete cert_agency_url(@cert_agency)
    end

    assert_redirected_to cert_agencies_url
  end
end
