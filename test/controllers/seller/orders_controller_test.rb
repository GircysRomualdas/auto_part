require "test_helper"

class Seller::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get seller_orders_index_url
    assert_response :success
  end
end
