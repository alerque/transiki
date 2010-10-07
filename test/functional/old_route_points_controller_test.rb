require 'test_helper'

class OldRoutePointsControllerTest < ActionController::TestCase
  setup do
    @old_route_point = old_route_points(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:old_route_points)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create old_route_point" do
    assert_difference('OldRoutePoint.count') do
      post :create, :old_route_point => @old_route_point.attributes
    end

    assert_redirected_to old_route_point_path(assigns(:old_route_point))
  end

  test "should show old_route_point" do
    get :show, :id => @old_route_point.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @old_route_point.to_param
    assert_response :success
  end

  test "should update old_route_point" do
    put :update, :id => @old_route_point.to_param, :old_route_point => @old_route_point.attributes
    assert_redirected_to old_route_point_path(assigns(:old_route_point))
  end

  test "should destroy old_route_point" do
    assert_difference('OldRoutePoint.count', -1) do
      delete :destroy, :id => @old_route_point.to_param
    end

    assert_redirected_to old_route_points_path
  end
end
