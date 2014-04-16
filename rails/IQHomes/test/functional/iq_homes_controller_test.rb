require 'test_helper'

class IQHomesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:iq_homes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create iq_home" do
    assert_difference('IQHome.count') do
      post :create, :iq_home => { }
    end

    assert_redirected_to iq_home_path(assigns(:iq_home))
  end

  test "should show iq_home" do
    get :show, :id => iq_homes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => iq_homes(:one).to_param
    assert_response :success
  end

  test "should update iq_home" do
    put :update, :id => iq_homes(:one).to_param, :iq_home => { }
    assert_redirected_to iq_home_path(assigns(:iq_home))
  end

  test "should destroy iq_home" do
    assert_difference('IQHome.count', -1) do
      delete :destroy, :id => iq_homes(:one).to_param
    end

    assert_redirected_to iq_homes_path
  end
end
