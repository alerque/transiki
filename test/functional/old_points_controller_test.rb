require 'test_helper'

class OldPointsControllerTest < ActionController::TestCase
  setup do
    @old_point = old_points(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:old_points)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create old_point" do
    assert_difference('OldPoint.count') do
      post :create, :old_point => @old_point.attributes
    end

    assert_redirected_to old_point_path(assigns(:old_point))
  end

  test "should show old_point" do
    get :show, :id => @old_point.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @old_point.to_param
    assert_response :success
  end

  test "should update old_point" do
    put :update, :id => @old_point.to_param, :old_point => @old_point.attributes
    assert_redirected_to old_point_path(assigns(:old_point))
  end

  test "should destroy old_point" do
    assert_difference('OldPoint.count', -1) do
      delete :destroy, :id => @old_point.to_param
    end

    assert_redirected_to old_points_path
  end
end
