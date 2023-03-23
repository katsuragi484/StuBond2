require "test_helper"

class Student::TeachersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get student_teachers_index_url
    assert_response :success
  end

  test "should get show" do
    get student_teachers_show_url
    assert_response :success
  end
end
