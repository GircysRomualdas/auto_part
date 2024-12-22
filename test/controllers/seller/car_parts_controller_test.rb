require "test_helper"

class Seller::CarPartsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get seller_car_parts_index_url
    assert_response :success
  end
end
