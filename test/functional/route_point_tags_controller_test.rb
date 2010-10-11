require 'test_helper'

class RoutePointTagsControllerTest < ActionController::TestCase
  setup do
    @route_point_tag = route_point_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:route_point_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create route_point_tag" do
    assert_difference('RoutePointTag.count') do
      post :create, :route_point_tag => @route_point_tag.attributes
    end

    assert_redirected_to route_point_tag_path(assigns(:route_point_tag))
  end

  test "should show route_point_tag" do
    get :show, :id => @route_point_tag.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @route_point_tag.to_param
    assert_response :success
  end

  test "should update route_point_tag" do
    put :update, :id => @route_point_tag.to_param, :route_point_tag => @route_point_tag.attributes
    assert_redirected_to route_point_tag_path(assigns(:route_point_tag))
  end

  test "should destroy route_point_tag" do
    assert_difference('RoutePointTag.count', -1) do
      delete :destroy, :id => @route_point_tag.to_param
    end

    assert_redirected_to route_point_tags_path
  end
end
