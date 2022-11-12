require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get searches" do
    get admin_searches_url
    assert_response :success
  end
end
