require 'test_helper'

class GuardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get guard_index_url
    assert_response :success
  end

end
