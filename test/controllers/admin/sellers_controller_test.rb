require "test_helper"

class Admin::SellersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_sellers_index_url
    assert_response :success
  end
end
