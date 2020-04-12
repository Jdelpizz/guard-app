require 'test_helper'

class CadetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cadets_index_url
    assert_response :success
  end

end
