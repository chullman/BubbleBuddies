require "test_helper"

class MeetupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meetup = meetups(:one)
  end

  test "should get index" do
    get meetups_url
    assert_response :success
  end

  test "should get new" do
    get new_meetup_url
    assert_response :success
  end

  test "should create meetup" do
    assert_difference('Meetup.count') do
      post meetups_url, params: { meetup: { city: @meetup.city, country: @meetup.country, date: @meetup.date, is_boat_required: @meetup.is_boat_required, is_commercial_trip: @meetup.is_commercial_trip, latitude: @meetup.latitude, longitude: @meetup.longitude, member_limit: @meetup.member_limit, name: @meetup.name, price: @meetup.price, state: @meetup.state, street_address: @meetup.street_address } }
    end

    assert_redirected_to meetup_url(Meetup.last)
  end

  test "should show meetup" do
    get meetup_url(@meetup)
    assert_response :success
  end

  test "should get edit" do
    get edit_meetup_url(@meetup)
    assert_response :success
  end

  test "should update meetup" do
    patch meetup_url(@meetup), params: { meetup: { city: @meetup.city, country: @meetup.country, date: @meetup.date, is_boat_required: @meetup.is_boat_required, is_commercial_trip: @meetup.is_commercial_trip, latitude: @meetup.latitude, longitude: @meetup.longitude, member_limit: @meetup.member_limit, name: @meetup.name, price: @meetup.price, state: @meetup.state, street_address: @meetup.street_address } }
    assert_redirected_to meetup_url(@meetup)
  end

  test "should destroy meetup" do
    assert_difference('Meetup.count', -1) do
      delete meetup_url(@meetup)
    end

    assert_redirected_to meetups_url
  end
end
