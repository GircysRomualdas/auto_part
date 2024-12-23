require "test_helper"

class Customer::CartsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get customer_carts_show_url
    assert_response :success
  end
end
