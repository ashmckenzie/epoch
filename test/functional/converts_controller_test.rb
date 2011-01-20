require 'test_helper'

class ConvertsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:converts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create convert" do
    assert_difference('Convert.count') do
      post :create, :convert => { }
    end

    assert_redirected_to convert_path(assigns(:convert))
  end

  test "should show convert" do
    get :show, :id => converts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => converts(:one).to_param
    assert_response :success
  end

  test "should update convert" do
    put :update, :id => converts(:one).to_param, :convert => { }
    assert_redirected_to convert_path(assigns(:convert))
  end

  test "should destroy convert" do
    assert_difference('Convert.count', -1) do
      delete :destroy, :id => converts(:one).to_param
    end

    assert_redirected_to converts_path
  end
end
