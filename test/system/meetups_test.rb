require "application_system_test_case"

class MeetupsTest < ApplicationSystemTestCase
  setup do
    @meetup = meetups(:one)
  end

  test "visiting the index" do
    visit meetups_url
    assert_selector "h1", text: "Meetups"
  end

  test "creating a Meetup" do
    visit meetups_url
    click_on "New Meetup"

    fill_in "City", with: @meetup.city
    fill_in "Country", with: @meetup.country
    fill_in "Date", with: @meetup.date
    fill_in "Description", with: @meetup.description
    fill_in "Is Boat Required", with: @meetup.is_boat_required
    fill_in "Is Commercial Trip", with: @meetup.is_commercial_trip
    fill_in "Latitude", with: @meetup.latitude
    fill_in "Longitude", with: @meetup.longitude
    fill_in "Member Limit", with: @meetup.member_limit
    fill_in "Name", with: @meetup.name
    fill_in "Price", with: @meetup.price
    fill_in "State", with: @meetup.state
    fill_in "Street Address", with: @meetup.street_address
    click_on "Create Meetup"

    assert_text "Meetup was successfully created"
    click_on "Back"
  end

  test "updating a Meetup" do
    visit meetups_url
    click_on "Edit", match: :first

    fill_in "City", with: @meetup.city
    fill_in "Country", with: @meetup.country
    fill_in "Date", with: @meetup.date
    fill_in "Description", with: @meetup.description
    fill_in "Is Boat Required", with: @meetup.is_boat_required
    fill_in "Is Commercial Trip", with: @meetup.is_commercial_trip
    fill_in "Latitude", with: @meetup.latitude
    fill_in "Longitude", with: @meetup.longitude
    fill_in "Member Limit", with: @meetup.member_limit
    fill_in "Name", with: @meetup.name
    fill_in "Price", with: @meetup.price
    fill_in "State", with: @meetup.state
    fill_in "Street Address", with: @meetup.street_address
    click_on "Update Meetup"

    assert_text "Meetup was successfully updated"
    click_on "Back"
  end

  test "destroying a Meetup" do
    visit meetups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Meetup was successfully destroyed"
  end
end
