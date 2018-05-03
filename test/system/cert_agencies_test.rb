require "application_system_test_case"

class CertAgenciesTest < ApplicationSystemTestCase
  setup do
    @cert_agency = cert_agencies(:one)
  end

  test "visiting the index" do
    visit cert_agencies_url
    assert_selector "h1", text: "Cert Agencies"
  end

  test "creating a Cert agency" do
    visit cert_agencies_url
    click_on "New Cert Agency"

    fill_in "Cert Agency", with: @cert_agency.cert_agency
    click_on "Create Cert agency"

    assert_text "Cert agency was successfully created"
    click_on "Back"
  end

  test "updating a Cert agency" do
    visit cert_agencies_url
    click_on "Edit", match: :first

    fill_in "Cert Agency", with: @cert_agency.cert_agency
    click_on "Update Cert agency"

    assert_text "Cert agency was successfully updated"
    click_on "Back"
  end

  test "destroying a Cert agency" do
    visit cert_agencies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cert agency was successfully destroyed"
  end
end
