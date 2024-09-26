require "test_helper"

class Admin::ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get per_country" do
    get admin_reports_per_country_url
    assert_response :success
  end
end
