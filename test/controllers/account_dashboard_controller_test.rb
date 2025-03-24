require "test_helper"

class AccountDashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get account_dashboard_show_url
    assert_response :success
  end
end
