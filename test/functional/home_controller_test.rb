require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index,about" do
    get :index,about
    assert_response :success
  end

end
