require 'test_helper'

class BillControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

end
