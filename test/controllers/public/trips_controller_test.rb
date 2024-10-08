require "test_helper"

class Public::TripsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_trips_new_url
    assert_response :success
  end

  test "should get index" do
    get public_trips_index_url
    assert_response :success
  end

  test "should get show" do
    get public_trips_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_trips_edit_url
    assert_response :success
  end
end
