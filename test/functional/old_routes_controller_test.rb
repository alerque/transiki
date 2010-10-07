require 'test_helper'

class OldRoutesControllerTest < ActionController::TestCase
  setup do
    @old_route = old_routes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:old_routes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create old_route" do
    assert_difference('OldRoute.count') do
      post :create, :old_route => @old_route.attributes
    end

    assert_redirected_to old_route_path(assigns(:old_route))
  end

  test "should show old_route" do
    get :show, :id => @old_route.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @old_route.to_param
    assert_response :success
  end

  test "should update old_route" do
    put :update, :id => @old_route.to_param, :old_route => @old_route.attributes
    assert_redirected_to old_route_path(assigns(:old_route))
  end

  test "should destroy old_route" do
    assert_difference('OldRoute.count', -1) do
      delete :destroy, :id => @old_route.to_param
    end

    assert_redirected_to old_routes_path
  end
end
