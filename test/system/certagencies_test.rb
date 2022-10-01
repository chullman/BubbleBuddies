require "application_system_test_case"

class CertagenciesTest < ApplicationSystemTestCase
  setup { @certagency = certagencies(:one) }

  test "visiting the index" do
    visit certagencies_url
    assert_selector "h1", text: "Certagencies"
  end

  test "creating a Certagency" do
    visit certagencies_url
    click_on "New Certagency"

    fill_in "Cert agency", with: @certagency.cert_agency
    click_on "Create Certagency"

    assert_text "Certagency was successfully created"
    click_on "Back"
  end

  test "updating a Certagency" do
    visit certagencies_url
    click_on "Edit", match: :first

    fill_in "Cert agency", with: @certagency.cert_agency
    click_on "Update Certagency"

    assert_text "Certagency was successfully updated"
    click_on "Back"
  end

  test "destroying a Certagency" do
    visit certagencies_url
    page.accept_confirm { click_on "Destroy", match: :first }

    assert_text "Certagency was successfully destroyed"
  end
end
