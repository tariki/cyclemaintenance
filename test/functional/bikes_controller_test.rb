require 'test_helper'

class BikesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bikes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bike" do
    assert_difference('Bike.count') do
      post :create, :bike => { }
    end

    assert_redirected_to bike_path(assigns(:bike))
  end

  test "should show bike" do
    get :show, :id => bikes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => bikes(:one).to_param
    assert_response :success
  end

  test "should update bike" do
    put :update, :id => bikes(:one).to_param, :bike => { }
    assert_redirected_to bike_path(assigns(:bike))
  end

  test "should destroy bike" do
    assert_difference('Bike.count', -1) do
      delete :destroy, :id => bikes(:one).to_param
    end

    assert_redirected_to bikes_path
  end
end
