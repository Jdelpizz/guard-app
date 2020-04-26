require 'test_helper'

class BuglemasterControllerTest < ActionDispatch::IntegrationTest
  test "should get bugleschedule" do
    get buglemaster_bugleschedule_url
    assert_response :success
  end

end
