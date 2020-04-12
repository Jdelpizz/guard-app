require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get cadets_index_url
    assert_response :success
  end

  test "should get show" do
    get cadets_show_url
    assert_response :success
  end

  test "should get new" do
    get cadets_new_url
    assert_response :success
  end

  test "should get edit" do
    get cadets_edit_url
    assert_response :success
  end

end
