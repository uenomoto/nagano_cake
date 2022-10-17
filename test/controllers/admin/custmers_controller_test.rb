require "test_helper"

class Admin::CustmersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_custmers_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_custmers_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_custmers_edit_url
    assert_response :success
  end
end
