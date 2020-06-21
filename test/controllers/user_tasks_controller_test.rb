require 'test_helper'

class UserTasksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_tasks_index_url
    assert_response :success
  end

  test "should get new" do
    get user_tasks_new_url
    assert_response :success
  end

  test "should get edit" do
    get user_tasks_edit_url
    assert_response :success
  end

  test "should get show" do
    get user_tasks_show_url
    assert_response :success
  end

end
