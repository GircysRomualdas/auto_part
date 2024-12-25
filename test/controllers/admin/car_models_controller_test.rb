require "test_helper"

class Admin::CarModelsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_car_models_index_url
    assert_response :success
  end
end
