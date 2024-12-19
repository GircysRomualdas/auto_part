require "test_helper"

class CarPartsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get car_parts_show_url
    assert_response :success
  end
end
