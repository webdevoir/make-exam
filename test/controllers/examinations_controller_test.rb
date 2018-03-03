require 'test_helper'

class ExaminationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get examinations_index_url
    assert_response :success
  end

  test "should get show" do
    get examinations_show_url
    assert_response :success
  end

  test "should get new" do
    get examinations_new_url
    assert_response :success
  end

  test "should get edit" do
    get examinations_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get examinations_destroy_url
    assert_response :success
  end

end
