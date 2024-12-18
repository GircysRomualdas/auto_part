require "test_helper"

class Admin::PartTypesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_part_types_index_url
    assert_response :success
  end
end
