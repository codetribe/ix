require 'test_helper'

class DisplayControllerTest < ActionController::TestCase
  test "should get bill" do
    get :bill
    assert_response :success
  end

end
