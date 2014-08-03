#http://media.pragprog.com/titles/rails4/code/rails40/depot_r/test/controllers/sessions_controller_test.rb
require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should login" do
    jzzdog = users(:one)    
    post :create, name: jzzdog.name, password: '1qazXSW@'
    assert_redirected_to adv_list_index_url
    assert_equal jzzdog.id, session[:user_id]
  end

  test "should fail login" do
    dave = users(:one)
    post :create, name: dave.name, password: 'wrong'
    assert_redirected_to login_url
  end

  test "should logout" do
    delete :destroy
    assert_redirected_to adv_list_index_url
  end
end
