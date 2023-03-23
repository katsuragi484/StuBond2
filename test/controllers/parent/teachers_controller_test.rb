require "test_helper"

class Parent::TeachersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get parent_teachers_index_url
    assert_response :success
  end

  test "should get show" do
    get parent_teachers_show_url
    assert_response :success
  end
end
