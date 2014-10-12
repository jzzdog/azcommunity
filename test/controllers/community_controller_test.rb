require 'test_helper'

class CommunityControllerTest < ActionController::TestCase
  test "should get news" do
    get :news
    assert_response :success
  end

end
