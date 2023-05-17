require "test_helper"

class LensesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lenses_index_url
    assert_response :success
  end

  test "should get new" do
    get lenses_new_url
    assert_response :success
  end

  test "should get create" do
    get lenses_create_url
    assert_response :success
  end

  test "should get edit" do
    get lenses_edit_url
    assert_response :success
  end

  test "should get show" do
    get lenses_show_url
    assert_response :success
  end

  test "should get update" do
    get lenses_update_url
    assert_response :success
  end

  test "should get destroy" do
    get lenses_destroy_url
    assert_response :success
  end
end
