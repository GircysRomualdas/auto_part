require "test_helper"

class PartTypesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get part_types_show_url
    assert_response :success
  end
end
